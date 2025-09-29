import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable, BehaviorSubject } from 'rxjs';
import { environment } from '../environments/environment';

@Injectable({
  providedIn: 'root'
})
export class TokenRefreshService {
  private isRefreshing = false;
  private refreshTokenSubject: BehaviorSubject<any> = new BehaviorSubject<any>(null);

  constructor(private http: HttpClient) { }

  /**
   * Refresh the access token using refresh token
   */
  refreshToken(): Observable<any> {
    const refreshToken = localStorage.getItem('refreshToken');
    
    if (!refreshToken) {
      throw new Error('No refresh token available');
    }

    const apiUrl = `${environment.apiUrl}/Auth/refresh-token`;
    
    return this.http.post(apiUrl, null, {
      params: { refreshToken: refreshToken }
    });
  }

  /**
   * Check if token refresh is in progress
   */
  isTokenRefreshing(): boolean {
    return this.isRefreshing;
  }

  /**
   * Set token refresh status
   */
  setRefreshingStatus(status: boolean): void {
    this.isRefreshing = status;
  }

  /**
   * Get refresh token subject for queuing requests
   */
  getRefreshTokenSubject(): BehaviorSubject<any> {
    return this.refreshTokenSubject;
  }

  /**
   * Update tokens in localStorage
   */
  updateTokens(tokenData: any): void {
    if (tokenData.result) {
      const result = tokenData.result;
      
      if (result.token) {
        localStorage.setItem('token', result.token);
      }
      
      if (result.refreshToken) {
        localStorage.setItem('refreshToken', result.refreshToken);
      }
      
      console.log('Tokens updated successfully');
    }
  }

  /**
   * Check if token is expired (basic check)
   */
  isTokenExpired(): boolean {
    const token = localStorage.getItem('token');
    
    if (!token) {
      return true;
    }

    try {
      // Basic JWT token expiry check
      const tokenPayload = JSON.parse(atob(token.split('.')[1]));
      const currentTime = Math.floor(Date.now() / 1000);
      
      return tokenPayload.exp < currentTime;
    } catch (error) {
      console.error('Error checking token expiry:', error);
      return true;
    }
  }

  /**
   * Clear all authentication data
   */
  clearAuthData(): void {
    localStorage.removeItem('token');
    localStorage.removeItem('refreshToken');
    localStorage.removeItem('loginId');
    localStorage.removeItem('role');
    localStorage.removeItem('fname');
    localStorage.removeItem('lname');
    localStorage.removeItem('userid');
    
    console.log('Authentication data cleared by TokenRefreshService');
  }
}
