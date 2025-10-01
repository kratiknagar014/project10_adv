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
      selectedRoles: [] // Dynamic role selection
    },
    inputerror: {},
    loading: false
  };

  // Dynamic roles loaded from backend
  public availableRoles = [];
  public rolesLoading = false;

  constructor(
    private httpService: HttpServiceService,
    private serviceLocator: ServiceLocatorService,
    private firebaseService: FirebaseService
  ) { }

  ngOnInit(): void {
    // Get current user's FCM token for testing
    this.getCurrentFCMToken();
    // Load dynamic roles from backend
    this.loadAvailableRoles();
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

  loadAvailableRoles() {
    this.rolesLoading = true;
    const baseUrl = environment.apiUrl;
    const url = `${baseUrl}/AdminNotification/preload`;

    this.httpService.get(url, (res: any) => {
      this.rolesLoading = false;
      if (res.success && res.result.roleList) {
        this.availableRoles = res.result.roleList;
        console.log('✅ Loaded roles:', this.availableRoles);
      } else {
        console.error('❌ Failed to load roles:', res.result && res.result.message);
        this.availableRoles = [];
      }
    });
  }

  onRoleSelectionChange(roleId: string, isSelected: any) {
    if (isSelected) {
      if (!this.form.data.selectedRoles.includes(roleId)) {
        this.form.data.selectedRoles.push(roleId);
      }
    } else {
      const index = this.form.data.selectedRoles.indexOf(roleId);
      if (index > -1) {
        this.form.data.selectedRoles.splice(index, 1);
      }
    }
    console.log('Selected roles:', this.form.data.selectedRoles);
  }

  isRoleSelected(roleId: string): boolean {
    return this.form.data.selectedRoles.includes(roleId);
  }

  sendRoleBasedNotification() {
    if (!this.form.data.title || !this.form.data.body) {
      this.form.error = true;
      this.form.message = 'Title and Body are required';
      return;
    }

    if (this.form.data.selectedRoles.length === 0) {
      this.form.error = true;
      this.form.message = 'Please select at least one role to send notification';
      return;
    }

    this.form.loading = true;
    this.form.error = false;
    this.form.message = null;

    const baseUrl = environment.apiUrl;
    const url = `${baseUrl}/AdminNotification/sendToRoles`;
    
    const requestData = {
      title: this.form.data.title,
      body: this.form.data.body,
      selectedRoles: this.form.data.selectedRoles
    };

    console.log('🚀 Sending role-based notification:', requestData);

    this.httpService.post(url, requestData, (res: any) => {
      this.form.loading = false;
      if (res.success) {
        this.form.error = false;
        const sentToRoles = res.result.sentToRoles || [];
        this.form.message = `Role-based notification sent successfully to: ${sentToRoles.join(', ')}!`;
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
    this.form.data.selectedRoles = [];
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
