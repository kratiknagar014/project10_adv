import { Component, OnInit } from '@angular/core';
import { FormGroup, FormControl } from '@angular/forms';
import { HttpServiceService } from '../http-service.service';
import { Router } from '@angular/router';
import { DataValidator } from '../utility/data-validator';
import { CookieService } from 'ngx-cookie-service';
import { ActivatedRoute } from '@angular/router';
import { ServiceLocatorService } from '../service-locator.service';
import { FirebaseService } from '../firebase.service';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {

  endpoint = this.serviceLocator.endpoints.SERVER_URL + "/Auth";

  form = {
    error: false,
    message: '',
    loginId: '',
    password: '',
    loginUrl: '',
    phoneNumber: '',
    loading: false
  };

  // Alert dismissal functionality
  showAlert = true;

  inputerror = {};
  message = '';
  showPhoneLogin = false;
  showEmailLogin = true;

  // Method to dismiss alerts
  dismissAlert() {
    this.form.message = '';
    this.form.error = false;
    this.showAlert = false;
  }

  // Setup FCM notifications after login
  async setupNotifications() {
    try {
      console.log('🔔 Setting up notifications after login...');
      
      // Check if user has already made a decision
      const notificationStatus = localStorage.getItem('notification-status');
      const lastAsked = localStorage.getItem('notification-last-asked');
      const currentTime = Date.now();
      const oneDayMs = 24 * 60 * 60 * 1000; // 1 day in milliseconds
      
      // Don't ask again if:
      // 1. User already subscribed
      // 2. User denied and it's been less than 1 day
      // 3. User chose "later" and it's been less than 1 day
      if (notificationStatus === 'subscribed') {
        console.log('✅ User already subscribed to notifications');
        return;
      }
      
      if (notificationStatus === 'denied' && lastAsked && (currentTime - parseInt(lastAsked)) < oneDayMs) {
        console.log('⏰ User denied recently, will ask again later');
        return;
      }
      
      if (notificationStatus === 'later' && lastAsked && (currentTime - parseInt(lastAsked)) < oneDayMs) {
        console.log('⏰ User chose later, will ask again tomorrow');
        return;
      }
      
      // Show custom notification prompt instead of direct browser popup
      this.showNotificationPrompt();
      
    } catch (error) {
      console.error('❌ Error setting up notifications:', error);
    }
  }
  
  // Show custom notification prompt
  showNotificationPrompt() {
    // Create custom modal/dialog
    const shouldAsk = confirm(
      '🔔 Would you like to receive important notifications about your courses and results?\n\n' +
      '✅ Get instant updates about new results\n' +
      '✅ Receive important announcements\n' +
      '✅ Stay updated with course information\n\n' +
      'Click OK to enable notifications, or Cancel to skip.'
    );
    
    if (shouldAsk) {
      this.requestNotificationPermission();
    } else {
      // User chose to skip
      localStorage.setItem('notification-status', 'later');
      localStorage.setItem('notification-last-asked', Date.now().toString());
      console.log('📅 User chose to enable notifications later');
    }
  }
  
  // Request notification permission
  async requestNotificationPermission() {
    try {
      const token = await this.firebaseService.requestNotificationPermission();
      
      if (token) {
        console.log('✅ FCM Token obtained:', token);
        
        // Subscribe to all_users topic
        await this.subscribeToAllUsersTopicAPI(token);
        
        // Mark as subscribed
        localStorage.setItem('notification-status', 'subscribed');
        localStorage.setItem('notification-last-asked', Date.now().toString());
        
        console.log('✅ User subscribed to notifications');
        
        // Show success message
        this.form.message = '🔔 Notifications enabled successfully! You will receive important updates.';
        this.form.error = false;
      } else {
        // User denied browser permission
        localStorage.setItem('notification-status', 'denied');
        localStorage.setItem('notification-last-asked', Date.now().toString());
        console.log('❌ Notification permission denied by user');
      }
    } catch (error) {
      console.error('❌ Error requesting notification permission:', error);
      localStorage.setItem('notification-status', 'denied');
      localStorage.setItem('notification-last-asked', Date.now().toString());
    }
  }

  // Store FCM token in database and subscribe to topics
  async subscribeToAllUsersTopicAPI(fcmToken: string) {
    try {
      const userId = localStorage.getItem('userid');
      const userRole = localStorage.getItem('role'); // This is roleId from ST_ROLE table
      const roleName = localStorage.getItem('roleName'); // Role name for display
      
      console.log('🔄 Storing FCM token in database...');
      console.log('👤 User ID:', userId, 'Role:', roleName, 'RoleID:', userRole);
      
      // STEP 1: Store FCM token in database (ST_USER table)
      await this.storeFCMTokenInDatabase(userId, fcmToken, userRole);
      
      // Determine role-based topic using existing roleId system
      let roleTopic = 'all_users';
      
      // Use existing roleId from st_role table
      if (userRole === '1' || userRole === 'Admin') {
        roleTopic = 'role_1'; // Admin role
      } else if (userRole === '2' || userRole === 'Student') {
        roleTopic = 'role_2'; // Student role  
      } else if (userRole === '3' || userRole === 'Faculty') {
        roleTopic = 'role_3'; // Faculty role
      } else if (userRole === '4' || userRole === 'College') {
        roleTopic = 'role_4'; // College role
      } else {
        // For any other roleId, create dynamic topic
        roleTopic = `role_${userRole}`;
      }

      const subscriptionData = {
        fcmToken: fcmToken,
        userId: userId,
        userRole: userRole,
        topics: ['all_users', roleTopic] // Subscribe to both all_users and role-specific
      };

      this.httpService.post(this.endpoint + '/subscribe-topics', subscriptionData, (res: any) => {
        if (res.success) {
          console.log('✅ Successfully subscribed to topics:', ['all_users', roleTopic]);
          localStorage.setItem('notification-subscribed', 'true');
          localStorage.setItem('subscribed-topics', JSON.stringify(['all_users', roleTopic]));
        } else {
          console.error('❌ Failed to subscribe to topics:', res.result.message);
        }
      });
    } catch (error) {
      console.error('❌ Error subscribing to topics:', error);
    }
  }
  userparams = {
    url: '',
    sessionExpiredMsg: '',
    methodType: '',
  };

  constructor(
    private httpService: HttpServiceService,
    private dataValidator: DataValidator,
    private router: Router,
    private cookieService: CookieService,
    private route: ActivatedRoute,
    private serviceLocator: ServiceLocatorService,
    private firebaseService: FirebaseService
  ) { }

  ngOnInit() {
    if (this.httpService.form.error == true) {
      this.form.message = this.httpService.form.message;
      this.form.error = this.httpService.form.error;
    }
    var a = '';
    this.serviceLocator.getPathVariable(this.route, function (params) {
      a = params["userparams"];
      console.log('I GOT ID, its logout', a);
    })
    if (a == 'true') {
      this.form.message = 'Logout Successfully';
    }
  }

  userSessionCheck() {
    this.route.paramMap.subscribe(params => {
      this.userparams = JSON.parse(this.route.snapshot.queryParamMap.get('userparams'));
      if (this.userparams != null) {
        this.form.message = this.userparams.sessionExpiredMsg;
        this.form.loginUrl = this.userparams.url;
      }
    });
    if (this.form.message != null) {
      this.form.error = true;
    }
  }

  validate() {
    let flag = true;
    flag = flag && this.dataValidator.isNotNull(this.form.loginId);
    console.log(this.form.loginId);
    flag = flag && this.dataValidator.isNotNull(this.form.password);
    console.log(this.form.password);
    return flag;
  }

  validatePhone() {
    return this.dataValidator.isNotNull(this.form.phoneNumber) && this.form.phoneNumber.length >= 10;
  }

  // Original Email/Password Login
  signIn() {
    var _self = this;
    this.form.error = false;
    const requestedUrl = this.httpService.userparams.url;
    console.log('signIn----', this.form);
    this.httpService.post(this.endpoint + "/login", this.form, function (res) {
      console.log('MyResponse', res);
      _self.form.message = '';
      _self.inputerror = {};

      if (_self.dataValidator.isNotNullObject(res.result.message)) {
        _self.form.message = res.result.message;
      }

      _self.form.error = !res.success;
      if (_self.dataValidator.isNotNullObject(res.result.inputerror)) {
        _self.inputerror = res.result.inputerror;
      }

      if (_self.dataValidator.isTrue(res.success)) {
        _self.form.error = false;
        _self.form.message = res.result.message;
        localStorage.setItem("token", res.result.token);
        localStorage.setItem("userid", res.result.data.id);
        localStorage.setItem("fname", res.result.data.firstName);
        localStorage.setItem("lname", res.result.data.lastName);
        localStorage.setItem("loginId", res.result.data.loginId);
        localStorage.setItem("role", res.result.data.roleId);
        localStorage.setItem("roleName", res.result.data.roleName);

        // CRITICAL: FCM Token collection for ALL users (not just admin)
        console.log('🎉 User logged in successfully, collecting FCM token...');
        console.log('👤 User:', res.result.data.firstName, res.result.data.lastName);
        console.log('🎭 Role:', res.result.data.roleName, '(ID:', res.result.data.roleId + ')');
        console.log('📧 Email:', res.result.data.loginId);
        console.log('🔑 User ID:', res.result.data.id);
        
        // Force notification permission and FCM token collection for ALL users
        console.log('🔔 Starting FCM token collection process...');
        _self.requestNotificationPermission();

        if (requestedUrl != null && requestedUrl != '') {
          _self.router.navigateByUrl(requestedUrl);
        } else {
          _self.router.navigateByUrl('dashboard');
        }
      }
    });
  }

  // Store FCM token in database
  async storeFCMTokenInDatabase(userId: string, fcmToken: string, userRole: string) {
    try {
      const tokenData = {
        userId: userId,
        fcmToken: fcmToken,
        userRole: userRole
      };

      console.log('💾 Sending FCM token to database:', {
        userId: userId,
        userRole: userRole,
        tokenLength: fcmToken.length
      });

      // Use Promise to handle the callback-based httpService
      return new Promise((resolve, reject) => {
        this.httpService.post(this.serviceLocator.endpoints.BASE_URL + '/NotificationToken/updateToken', tokenData, (res: any) => {
          if (res.success) {
            console.log('✅ FCM token stored in database successfully');
            console.log('📊 Response:', res.result);
            resolve(res);
          } else {
            console.error('❌ Failed to store FCM token:', res.result.message);
            reject(new Error(res.result.message || 'Failed to store FCM token'));
          }
        });
      });

    } catch (error) {
      console.error('❌ Error storing FCM token in database:', error);
      throw error;
    }
  }

  // Google Login
  async googleLogin() {
    this.form.loading = true;
    this.form.error = false;
    this.form.message = '';

    try {
      const result = await this.firebaseService.googleSignIn();
      if (result.success) {
        this.form.message = 'Google login successful!';
        
        // Setup notifications after successful Google login
        await this.setupNotifications();
        
        // FirebaseService automatically handles redirect
      } else {
        this.form.error = true;
        this.form.message = result.error || 'Google login failed';
      }
    } catch (error) {
      this.form.error = true;
      this.form.message = 'Google login failed. Please try again.';
    }

    this.form.loading = false;
  }

  // Phone Number Login - OTP Send
  async sendOTP() {
    if (!this.validatePhone()) {
      this.form.error = true;
      this.form.message = 'Please enter valid phone number';
      return;
    }

    this.form.loading = true;
    this.form.error = false;
    this.form.message = '';

    try {
      // Phone number ko +91 format mein convert karte hain
      let phoneNumber = this.form.phoneNumber;
      if (!phoneNumber.startsWith('+91')) {
        phoneNumber = '+91' + phoneNumber;
      }

      const result = await this.firebaseService.sendOTP(phoneNumber);

      if (result.success) {
        // Phone number temporary storage mein save karte hain
        localStorage.setItem('tempPhoneNumber', phoneNumber);
        this.form.message = 'OTP sent successfully!';

        // OTP verification page par redirect karte hain
        setTimeout(() => {
          this.router.navigateByUrl('/otp-verification');
        }, 1500);
      } else {
        this.form.error = true;
        this.form.message = result.error || 'Failed to send OTP';
      }
    } catch (error) {
      this.form.error = true;
      this.form.message = 'Failed to send OTP. Please try again.';
    }

    this.form.loading = false;
  }

  // Login method toggle karne ke liye
  toggleLoginMethod(method: string) {
    if (method === 'phone') {
      this.showPhoneLogin = true;
      this.showEmailLogin = false;
    } else {
      this.showPhoneLogin = false;
      this.showEmailLogin = true;
    }

    // Form reset karte hain
    this.form.error = false;
    this.form.message = '';
    this.form.loginId = '';
    this.form.password = '';
    this.form.phoneNumber = '';
    this.inputerror = {};
  }
}