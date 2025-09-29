import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { BehaviorSubject, Observable } from 'rxjs';
import { environment } from '../../environments/environment';

export interface Notification {
  id?: number;
  title: string;
  body: string;
  type?: string;
  status?: string;
  readStatus?: string;
  senderId?: number;
  senderName?: string;
  recipientId?: number;
  recipientRole?: string;
  sentTime?: Date;
  readTime?: Date;
  imageUrl?: string;
  clickAction?: string;
  priority?: string;
}

export interface NotificationForm {
  title: string;
  body: string;
  recipientId?: number;
  targetRole?: string;
  sendToAll?: boolean;
  type?: string;
  priority?: string;
  imageUrl?: string;
  clickAction?: string;
}

@Injectable({
  providedIn: 'root'
})
export class NotificationService {
  private apiUrl = `${environment.apiUrl}/Notification`;
  
  // Observable for unread notification count
  private unreadCountSubject = new BehaviorSubject<number>(0);
  public unreadCount$ = this.unreadCountSubject.asObservable();
  
  // Observable for notifications list
  private notificationsSubject = new BehaviorSubject<Notification[]>([]);
  public notifications$ = this.notificationsSubject.asObservable();

  constructor(private http: HttpClient) {
    this.loadUnreadCount();
  }

  // Send notification to specific user
  sendToUser(form: NotificationForm): Observable<any> {
    return this.http.post(`${this.apiUrl}/sendToUser`, form);
  }

  // Send notification to role
  sendToRole(form: NotificationForm): Observable<any> {
    return this.http.post(`${this.apiUrl}/sendToRole`, form);
  }

  // Send notification to all users
  sendToAll(form: NotificationForm): Observable<any> {
    return this.http.post(`${this.apiUrl}/sendToAll`, form);
  }

  // Get current user's notifications
  getMyNotifications(): Observable<any> {
    return this.http.get(`${this.apiUrl}/myNotifications`);
  }

  // Get unread notifications
  getUnreadNotifications(): Observable<any> {
    return this.http.get(`${this.apiUrl}/unread`);
  }

  // Get unread count
  getUnreadCount(): Observable<any> {
    return this.http.get(`${this.apiUrl}/unreadCount`);
  }

  // Mark notification as read
  markAsRead(id: number): Observable<any> {
    return this.http.post(`${this.apiUrl}/markAsRead/${id}`, {});
  }

  // Mark all notifications as read
  markAllAsRead(): Observable<any> {
    return this.http.post(`${this.apiUrl}/markAllAsRead`, {});
  }

  // Update FCM token
  updateFcmToken(fcmToken: string): Observable<any> {
    return this.http.post(`${this.apiUrl}/updateFcmToken`, null, {
      params: { fcmToken }
    });
  }

  // Test notification
  testNotification(fcmToken: string, title: string, body: string): Observable<any> {
    return this.http.post(`${this.apiUrl}/test`, null, {
      params: { fcmToken, title, body }
    });
  }

  // Load and update unread count
  loadUnreadCount(): void {
    this.getUnreadCount().subscribe(
      (response: any) => {
        if (response.success) {
          this.unreadCountSubject.next(response.result || 0);
        }
      },
      (error) => {
        console.error('Error loading unread count:', error);
      }
    );
  }

  // Load and update notifications list
  loadNotifications(): void {
    this.getMyNotifications().subscribe(
      (response: any) => {
        if (response.success) {
          this.notificationsSubject.next(response.result || []);
        }
      },
      (error) => {
        console.error('Error loading notifications:', error);
      }
    );
  }

  // Mark notification as read and update count
  markNotificationAsRead(id: number): void {
    this.markAsRead(id).subscribe(
      (response: any) => {
        if (response.success) {
          // Update local state
          const currentNotifications = this.notificationsSubject.value;
          const updatedNotifications = currentNotifications.map(notification => 
            notification.id === id 
              ? { ...notification, readStatus: 'read', readTime: new Date() }
              : notification
          );
          this.notificationsSubject.next(updatedNotifications);
          
          // Update unread count
          this.loadUnreadCount();
        }
      },
      (error) => {
        console.error('Error marking notification as read:', error);
      }
    );
  }

  // Mark all notifications as read and update count
  markAllNotificationsAsRead(): void {
    this.markAllAsRead().subscribe(
      (response: any) => {
        if (response.success) {
          // Update local state
          const currentNotifications = this.notificationsSubject.value;
          const updatedNotifications = currentNotifications.map(notification => 
            ({ ...notification, readStatus: 'read', readTime: new Date() })
          );
          this.notificationsSubject.next(updatedNotifications);
          
          // Reset unread count
          this.unreadCountSubject.next(0);
        }
      },
      (error) => {
        console.error('Error marking all notifications as read:', error);
      }
    );
  }

  // Show browser notification
  showBrowserNotification(title: string, body: string, icon?: string): void {
    if (Notification.permission === 'granted') {
      const notification = new Notification(title, {
        body,
        icon: icon || '/assets/icons/notification-icon.png',
        badge: '/assets/icons/badge-icon.png',
        tag: 'ors-notification'
      });

      notification.onclick = () => {
        window.focus();
        notification.close();
      };

      // Auto close after 5 seconds
      setTimeout(() => {
        notification.close();
      }, 5000);
    }
  }

  // Request notification permission
  async requestNotificationPermission(): Promise<boolean> {
    if ('Notification' in window) {
      const permission = await Notification.requestPermission();
      return permission === 'granted';
    }
    return false;
  }
}
