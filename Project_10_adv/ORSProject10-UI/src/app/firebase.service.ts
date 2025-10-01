import { Injectable } from '@angular/core';
import { AngularFireAuth } from '@angular/fire/auth';
import { HttpClient } from '@angular/common/http';
import { Router } from '@angular/router';
import { environment } from '../environments/environment';

import * as firebase from 'firebase/app';
import 'firebase/auth';
import 'firebase/messaging';

@Injectable({ providedIn: 'root' })
export class FirebaseService {
  private confirmationResult: firebase.auth.ConfirmationResult | null = null;
  private messaging: firebase.messaging.Messaging | null = null;

  constructor(
    private afAuth: AngularFireAuth,
    private http: HttpClient,
    private router: Router
  ) {
    this.initializeMessaging();
  }

  // Google Sign-In
  async googleSignIn(): Promise<{ success: boolean; error?: string }> {
    try {
      const provider = new firebase.auth.GoogleAuthProvider();
      const credential = await this.afAuth.auth.signInWithPopup(provider);

      const user = credential.user;
      const idToken = user ? await user.getIdToken(true) : undefined;

      const exchanged = await this.exchangeTokenAndSetSession(user, idToken, 'GOOGLE');
      return exchanged;
    } catch (e) {
      const msg = e && e['message'] ? e['message'] : 'Google login failed';
      return { success: false, error: msg };
    }
  }

  // Send OTP to phone number using reCAPTCHA (invisible)
  async sendOTP(phoneNumber: string): Promise<{ success: boolean; error?: string }> {
    try {
      const verifier = new firebase.auth.RecaptchaVerifier('recaptcha-container', {
        size: 'invisible'
      });

      this.confirmationResult = await this.afAuth.auth.signInWithPhoneNumber(phoneNumber, verifier);
      return { success: true };
    } catch (e) {
      const msg = e && e['message'] ? e['message'] : 'Failed to send OTP';
      return { success: false, error: msg };
    }
  }

  // Verify OTP code
  async verifyOTP(code: string): Promise<{ success: boolean; error?: string }> {
    try {
      if (!this.confirmationResult) {
        return { success: false, error: 'No OTP session found. Please resend OTP.' };
      }

      const credential = await this.confirmationResult.confirm(code);
      const user = credential.user;
      const idToken = user ? await user.getIdToken(true) : undefined;

      // Use new OTP verification endpoint
      const exchanged = await this.verifyOTPWithBackend(user, idToken);
      return exchanged;
    } catch (e) {
      const msg = e && e['message'] ? e['message'] : 'Invalid OTP. Please try again.';
      return { success: false, error: msg };
    }
  }

  // New method for OTP verification with backend
  private async verifyOTPWithBackend(
    user: firebase.User | null,
    firebaseToken: string | undefined
  ): Promise<{ success: boolean; error?: string }> {
    try {
      if (!user || !firebaseToken) {
        return { success: false, error: 'User or token missing' };
      }

      const displayName = user.displayName || '';
      const firstName = displayName ? displayName.split(' ')[0] : '';
      const lastName = displayName ? displayName.split(' ').slice(1).join(' ') : '';

      const payload = {
        phone: user.phoneNumber,
        firebaseToken,
        firstName,
        lastName
      };

      const apiUrl = `${environment.apiUrl}/Auth/verify-otp`;
      const res: any = await this.http
        .post(apiUrl, payload)
        .toPromise();

      const result = (res && res.result) ? res.result : (res || {});
      const tokenFromServer = result.token || firebaseToken;
      const userData = result.user || {};

      // Store token without Bearer prefix (auth interceptor will add it)
      localStorage.setItem('token', tokenFromServer);

      const loginIdToUse = userData.loginId || user.phoneNumber || user.uid || '';
      localStorage.setItem('loginId', loginIdToUse);

      // Ensure fname/lname are populated so interceptor activates
      const finalFirstName = userData.firstName || firstName || loginIdToUse;
      const finalLastName = userData.lastName || lastName || '';
      localStorage.setItem('fname', finalFirstName);
      localStorage.setItem('lname', finalLastName);

      if (userData.id) localStorage.setItem('userid', String(userData.id));
      if (userData.roleName) {
        localStorage.setItem('role', userData.roleName);
      } else if (userData.roleId) {
        localStorage.setItem('role', String(userData.roleId));
      }

      // Navigate to dashboard like existing flow
      this.router.navigateByUrl('dashboard');

      return { success: true };
    } catch (e) {
      const msg = e && e['message'] ? e['message'] : 'OTP verification failed';
      return { success: false, error: msg };
    }
  }

  // Initialize FCM
  private initializeMessaging() {
    try {
      if (firebase.messaging.isSupported()) {
        this.messaging = firebase.messaging();
        this.setupMessageListener();
      }
    } catch (error) {
      console.log('FCM not supported:', error);
    }
  }

  // Request notification permission and get FCM token
  async requestNotificationPermission(): Promise<string | null> {
    try {
      console.log('🔔 Requesting FCM permission...');
      console.log('Messaging service:', this.messaging);
      console.log('VAPID Key:', environment.firebase.vapidKey);
      
      if (!this.messaging) {
        console.error('❌ FCM messaging not initialized');
        return null;
      }

      const permission = await Notification.requestPermission();
      console.log('📱 Notification permission:', permission);
      
      if (permission === 'granted') {
        console.log('✅ Permission granted, getting token...');
        const vapidKey = environment.firebase.vapidKey || 'BJbUsHpk-DmmWDEGtYmviKh1slx6i8J2S4mam7wEI95Z4g56ToHRw8EwoRQjoe_SOkfhrLiplgPif7wV3D3Mrxk';
        console.log('🔑 Using VAPID Key:', vapidKey);
        
        const token = await this.messaging.getToken({
          vapidKey: vapidKey
        });
        console.log('🔑 FCM Token received:', token);
        
        if (token) {
          // Store token locally
          localStorage.setItem('fcm-token', token);
          
          // Note: Token will be sent to backend via login component
          return token;
        } else {
          console.error('❌ No token received');
          return null;
        }
      } else {
        console.log('❌ Notification permission denied');
        return null;
      }
    } catch (error) {
      console.error('❌ Error getting FCM token:', error);
      
      // Try alternative method without service worker
      try {
        console.log('🔄 Trying alternative method...');
        const vapidKey = 'BJbUsHpk-DmmWDEGtYmviKh1slx6i8J2S4mam7wEI95Z4g56ToHRw8EwoRQjoe_SOkfhrLiplgPif7wV3D3Mrxk';
        const token = await this.messaging.getToken({ vapidKey });
        if (token) {
          console.log('✅ Alternative method success:', token);
          localStorage.setItem('fcm-token', token);
          return token;
        }
      } catch (altError) {
        console.error('❌ Alternative method also failed:', altError);
      }
      
      return null;
    }
  }

  // Setup message listener for foreground messages
  private setupMessageListener() {
    if (!this.messaging) return;

    this.messaging.onMessage((payload) => {
      console.log('Message received in foreground:', payload);
      
      // Show custom notification
      this.showNotification(payload);
    });
  }

  // Show custom notification
  private showNotification(payload: any) {
    const notificationTitle = payload.notification && payload.notification.title ? payload.notification.title : 'New Notification';
    const notificationOptions = {
      body: payload.notification && payload.notification.body ? payload.notification.body : '',
      icon: payload.notification && payload.notification.icon ? payload.notification.icon : '/assets/icons/notification-icon.png',
      badge: '/assets/icons/badge-icon.png',
      tag: 'ors-notification',
      requireInteraction: true,
      actions: [
        {
          action: 'view',
          title: 'View'
        },
        {
          action: 'dismiss',
          title: 'Dismiss'
        }
      ]
    };

    if (Notification.permission === 'granted') {
      const notification = new Notification(notificationTitle, notificationOptions);
      
      notification.onclick = () => {
        window.focus();
        notification.close();
        // Navigate to notifications page
        this.router.navigate(['/notifications']);
      };
    }
  }

  // FCM token backend update is now handled in login component

  // Logout
  async signOut() {
    await this.afAuth.auth.signOut();
    localStorage.removeItem('token');
    localStorage.removeItem('loginId');
    localStorage.removeItem('role');
    localStorage.removeItem('fname');
    localStorage.removeItem('lname');
    localStorage.removeItem('userid');
    this.router.navigateByUrl('/login');
  }

  private async exchangeTokenAndSetSession(
    user: firebase.User | null,
    firebaseToken: string | undefined,
    loginType: string
  ): Promise<{ success: boolean; error?: string }> {
    try {
      if (!user || !firebaseToken) {
        return { success: false, error: 'User or token missing' };
      }

      const displayName = user.displayName || '';
      const firstName = displayName ? displayName.split(' ')[0] : '';
      const lastName = displayName ? displayName.split(' ').slice(1).join(' ') : '';

      const payload = {
        firebaseToken,
        firebaseUid: user.uid,
        email: user.email,
        phone: user.phoneNumber,
        firstName,
        lastName,
        loginType,
        profilePicture: user.photoURL || ''
      };

      const apiUrl = `${environment.apiUrl}/Auth/firebase-login`;
      const res: any = await this.http
        .post(apiUrl, payload)
        .toPromise();

      const result = (res && res.result) ? res.result : (res || {});
      const tokenFromServer = result.token || firebaseToken;
      const userData = result.user || {};

      // Store token without Bearer prefix (auth interceptor will add it)
      localStorage.setItem('token', tokenFromServer);

      const loginIdToUse = userData.loginId || user.email || user.phoneNumber || user.uid || '';
      localStorage.setItem('loginId', loginIdToUse);

      // Ensure fname/lname are populated so interceptor activates
      const finalFirstName = userData.firstName || firstName || loginIdToUse;
      const finalLastName = userData.lastName || lastName || '';
      localStorage.setItem('fname', finalFirstName);
      localStorage.setItem('lname', finalLastName);

      if (userData.id) localStorage.setItem('userid', String(userData.id));
      if (userData.roleName) {
        localStorage.setItem('role', userData.roleName);
      } else if (userData.roleId) {
        localStorage.setItem('role', String(userData.roleId));
      }

      // Navigate to dashboard like existing flow
      this.router.navigateByUrl('dashboard');

      return { success: true };
    } catch (e) {
      const msg = e && e['message'] ? e['message'] : 'Token exchange failed';
      return { success: false, error: msg };
    }
  }
}
