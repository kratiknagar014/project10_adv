import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { FirebaseService } from '../firebase.service';
import { HttpServiceService } from '../http-service.service';
import { environment } from '../../environments/environment';

@Component({
    selector: 'app-otp-verification',
    templateUrl: './otp-verification.component.html',
    styleUrls: ['./otp-verification.component.css']
})
export class OtpVerificationComponent implements OnInit {

    form = {
        otp: '',
        phoneNumber: '',
        error: false,
        message: '',
        loading: false
    };

    constructor(
        private firebaseService: FirebaseService,
        private router: Router,
        private httpService: HttpServiceService
    ) { }

    ngOnInit() {
        // Phone number localStorage se get karte hain
        this.form.phoneNumber = localStorage.getItem('tempPhoneNumber') || '';
        if (!this.form.phoneNumber) {
            this.router.navigateByUrl('/login');
        }
    }

    async verifyOTP() {
        if (!this.form.otp || this.form.otp.length !== 6) {
            this.form.error = true;
            this.form.message = 'Please enter valid 6-digit OTP';
            return;
        }

        this.form.loading = true;
        this.form.error = false;
        this.form.message = '';

        try {
            const result = await this.firebaseService.verifyOTP(this.form.otp);

            if (result.success) {
                // OTP verify ho gaya, localStorage clear karte hain
                localStorage.removeItem('tempPhoneNumber');
                this.form.message = 'Login successful!';
                
                // Setup notifications after successful OTP login
                await this.setupNotifications();
                
                // Firebase service automatically redirect kar degi
            } else {
                this.form.error = true;
                this.form.message = result.error || 'Invalid OTP. Please try again.';
            }
        } catch (error) {
            this.form.error = true;
            this.form.message = 'Something went wrong. Please try again.';
        }

        this.form.loading = false;
    }

    resendOTP() {
        this.form.loading = true;
        this.firebaseService.sendOTP(this.form.phoneNumber).then(result => {
            if (result.success) {
                this.form.message = 'OTP sent again successfully!';
                this.form.error = false;
            } else {
                this.form.error = true;
                this.form.message = result.error || 'Failed to resend OTP';
            }
            this.form.loading = false;
        });
    }

    goBack() {
        localStorage.removeItem('tempPhoneNumber');
        this.router.navigateByUrl('/login');
    }

    // Setup FCM notifications after login
    async setupNotifications() {
        try {
            console.log('🔔 Setting up notifications after OTP login...');
            
            // Check if user has already made a decision
            const notificationStatus = localStorage.getItem('notification-status');
            const lastAsked = localStorage.getItem('notification-last-asked');
            const currentTime = Date.now();
            const oneDayMs = 24 * 60 * 60 * 1000; // 1 day in milliseconds
            
            // Don't ask again if user already decided
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
            
            // Show custom notification prompt
            this.showNotificationPrompt();
            
        } catch (error) {
            console.error('❌ Error setting up notifications:', error);
        }
    }
    
    // Show custom notification prompt
    showNotificationPrompt() {
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
                this.form.message = '🔔 Notifications enabled successfully!';
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

    // Subscribe user to all_users topic via backend API
    async subscribeToAllUsersTopicAPI(fcmToken: string) {
        try {
            const userId = localStorage.getItem('userid');
            const subscriptionData = {
                fcmToken: fcmToken,
                userId: userId,
                topic: 'all_users'
            };

            const baseUrl = environment.apiUrl;
            const url = `${baseUrl}/Auth/subscribe-topic`;

            this.httpService.post(url, subscriptionData, (res: any) => {
                if (res.success) {
                    console.log('✅ Successfully subscribed to all_users topic');
                    localStorage.setItem('notification-subscribed', 'true');
                } else {
                    console.error('❌ Failed to subscribe to topic:', res.result.message);
                }
            });
        } catch (error) {
            console.error('❌ Error subscribing to topic:', error);
        }
    }
}
