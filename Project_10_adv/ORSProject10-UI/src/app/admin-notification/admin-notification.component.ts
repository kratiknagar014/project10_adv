import { Component, OnInit } from '@angular/core';
import { ServiceLocatorService } from '../service-locator.service';
import { ActivatedRoute } from '@angular/router';
import { FirebaseService } from '../firebase.service';
import { HttpServiceService } from '../http-service.service';
import { environment } from '../../environments/environment';

@Component({
  selector: 'app-admin-notification',
  templateUrl: './admin-notification.component.html',
  styleUrls: ['./admin-notification.component.css']
})
export class AdminNotificationComponent implements OnInit {

  public form = {
    error: false,
    message: null,
    data: {
      title: '',
      body: '',
      fcmToken: '',
      type: 'test', // 'test', 'role-based', or 'broadcast'
      roles: {
        students: false,
        faculty: false,
        college: false
      }
    },
    inputerror: {},
    loading: false
  };

  constructor(
    private httpService: HttpServiceService,
    private serviceLocator: ServiceLocatorService,
    private firebaseService: FirebaseService
  ) { }

  ngOnInit(): void {
    // Get current user's FCM token for testing
    this.getCurrentFCMToken();
  }

  async getCurrentFCMToken() {
    try {
      console.log('🔍 Getting FCM token...');
      
      // First try to get from localStorage
      let token = localStorage.getItem('fcm-token');
      console.log('📦 Token from localStorage:', token);
      
      if (!token) {
        // Generate a dummy token for testing (since service worker is not working)
        token = 'demo_token_' + Math.random().toString(36).substr(2, 9) + '_' + Date.now();
        console.log('🔄 Generated demo token for testing:', token);
        localStorage.setItem('fcm-token', token);
      }
      
      if (token) {
        this.form.data.fcmToken = token;
        console.log('✅ FCM token set:', token.substring(0, 20) + '...');
      } else {
        console.error('❌ No FCM token available');
      }
    } catch (error) {
      console.error('❌ Error getting FCM token:', error);
      // Fallback demo token
      const demoToken = 'demo_token_fallback_' + Date.now();
      this.form.data.fcmToken = demoToken;
      localStorage.setItem('fcm-token', demoToken);
    }
  }

  sendTestNotification() {
    if (!this.form.data.title || !this.form.data.body) {
      this.form.error = true;
      this.form.message = 'Title and Body are required';
      return;
    }

    if (!this.form.data.fcmToken) {
      this.form.error = true;
      this.form.message = 'FCM Token is required for test notification';
      return;
    }

    this.form.loading = true;
    this.form.error = false;
    this.form.message = null;

    // Use environment-based URL
    const baseUrl = environment.apiUrl;
    const url = `${baseUrl}/AdminNotification/sendTest`;
    const queryParams = `?fcmToken=${encodeURIComponent(this.form.data.fcmToken)}&title=${encodeURIComponent(this.form.data.title)}&body=${encodeURIComponent(this.form.data.body)}`;

    this.httpService.get(url + queryParams, (res: any) => {
      this.form.loading = false;
      if (res.success) {
        this.form.error = false;
        this.form.message = 'Test notification sent successfully!';
        this.resetForm();
      } else {
        this.form.error = true;
        this.form.message = (res.result && res.result.message) || 'Failed to send notification';
      }
    });
  }

  sendBroadcastNotification() {
    if (!this.form.data.title || !this.form.data.body) {
      this.form.error = true;
      this.form.message = 'Title and Body are required';
      return;
    }

    this.form.loading = true;
    this.form.error = false;
    this.form.message = null;

    // Use environment-based URL
    const baseUrl = environment.apiUrl;
    const url = `${baseUrl}/AdminNotification/broadcast`;
    const queryParams = `?title=${encodeURIComponent(this.form.data.title)}&body=${encodeURIComponent(this.form.data.body)}`;

    this.httpService.get(url + queryParams, (res: any) => {
      this.form.loading = false;
      if (res.success) {
        this.form.error = false;
        this.form.message = 'Broadcast notification sent successfully!';
        this.resetForm();
      } else {
        this.form.error = true;
        this.form.message = (res.result && res.result.message) || 'Failed to send broadcast notification';
      }
    });
  }

  sendRoleBasedNotification() {
    if (!this.form.data.title || !this.form.data.body) {
      this.form.error = true;
      this.form.message = 'Title and Body are required';
      return;
    }

    // Check if at least one role is selected using existing st_role table IDs
    const selectedRoles = [];
    if (this.form.data.roles.students) selectedRoles.push('role_2'); // Student roleId = 2
    if (this.form.data.roles.faculty) selectedRoles.push('role_3');   // Faculty roleId = 3  
    if (this.form.data.roles.college) selectedRoles.push('role_4');   // College roleId = 4

    if (selectedRoles.length === 0) {
      this.form.error = true;
      this.form.message = 'Please select at least one role to send notification';
      return;
    }

    this.form.loading = true;
    this.form.error = false;
    this.form.message = null;

    // Use environment-based URL
    const baseUrl = environment.apiUrl;
    const url = `${baseUrl}/AdminNotification/sendToRoles`;
    
    const requestData = {
      title: this.form.data.title,
      body: this.form.data.body,
      targetRoles: selectedRoles,
      roleNames: {
        students: this.form.data.roles.students,
        faculty: this.form.data.roles.faculty,
        college: this.form.data.roles.college
      }
    };

    this.httpService.post(url, requestData, (res: any) => {
      this.form.loading = false;
      if (res.success) {
        this.form.error = false;
        const roleCount = selectedRoles.length;
        const roleNames = [];
        if (this.form.data.roles.students) roleNames.push('Students');
        if (this.form.data.roles.faculty) roleNames.push('Faculty');
        if (this.form.data.roles.college) roleNames.push('College');
        
        this.form.message = `Role-based notification sent successfully to ${roleNames.join(', ')}!`;
        this.resetForm();
      } else {
        this.form.error = true;
        this.form.message = (res.result && res.result.message) || 'Failed to send role-based notification';
      }
    });
  }

  resetForm() {
    this.form.data.title = '';
    this.form.data.body = '';
    this.form.data.roles.students = false;
    this.form.data.roles.faculty = false;
    this.form.data.roles.college = false;
    // Keep FCM token for convenience
  }

  onSubmit() {
    if (this.form.data.type === 'test') {
      this.sendTestNotification();
    } else if (this.form.data.type === 'role-based') {
      this.sendRoleBasedNotification();
    } else {
      this.sendBroadcastNotification();
    }
  }
}
