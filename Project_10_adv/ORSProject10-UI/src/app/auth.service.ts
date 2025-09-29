import { Injectable } from '@angular/core';
import { HttpInterceptor, HttpRequest, HttpHandler, HttpEvent, HttpErrorResponse } from '@angular/common/http';
import { HttpServiceService } from './http-service.service';
import { TokenRefreshService } from './token-refresh.service';
import { Router } from '@angular/router';
import { Observable, throwError, EMPTY } from 'rxjs';
import { catchError, switchMap, filter, take } from 'rxjs/operators';

@Injectable({
  providedIn: 'root'
})
export class AuthService implements HttpInterceptor {

  constructor(
    private http: HttpServiceService, 
    private router: Router,
    private tokenRefreshService: TokenRefreshService
  ) { }

  intercept(req: HttpRequest<any>, next: HttpHandler): Observable<HttpEvent<any>> {

    if (localStorage.getItem('fname') && localStorage.getItem('token')) {
      req = req.clone({
        setHeaders: {
          "withCredentials": "true",
          "name": "rajat",
          Authorization: this.http.getToken()
        }
      })
    }
    
    console.log(req.headers.get("Authorization") + "------------------->>>")
    
    return next.handle(req).pipe(
      catchError((error: HttpErrorResponse) => {
        console.log('HTTP Error Status:', error.status);
        console.log('HTTP Error Message:', error.message);
        
        // Handle 401 (Unauthorized) errors - Try token refresh first
        if (error.status === 401) {
          console.log('401 Unauthorized - Attempting token refresh');
          
          // Skip refresh for login and refresh-token endpoints
          if (req.url.includes('/login') || req.url.includes('/refresh-token')) {
            this.handleAuthError();
            return throwError('Authentication failed');
          }
          
          return this.handleTokenRefresh(req, next);
        }
        
        // Handle 403 (Forbidden) errors - Direct logout
        if (error.status === 403) {
          console.log('403 Forbidden - Access denied');
          this.handleAuthError();
          return throwError('Access denied');
        }
        
        // Handle other errors
        return throwError(error);
      })
    );
  }

  /**
   * Handle token refresh logic
   */
  private handleTokenRefresh(req: HttpRequest<any>, next: HttpHandler): Observable<HttpEvent<any>> {
    if (!this.tokenRefreshService.isTokenRefreshing()) {
      this.tokenRefreshService.setRefreshingStatus(true);
      this.tokenRefreshService.getRefreshTokenSubject().next(null);

      return this.tokenRefreshService.refreshToken().pipe(
        switchMap((tokenData: any) => {
          this.tokenRefreshService.setRefreshingStatus(false);
          this.tokenRefreshService.updateTokens(tokenData);
          this.tokenRefreshService.getRefreshTokenSubject().next(tokenData.result.token);

          // Retry original request with new token
          const newReq = req.clone({
            setHeaders: {
              Authorization: `Bearer ${tokenData.result.token}`
            }
          });

          return next.handle(newReq);
        }),
        catchError((refreshError) => {
          this.tokenRefreshService.setRefreshingStatus(false);
          console.log('Token refresh failed:', refreshError);
          this.handleAuthError();
          return throwError('Token refresh failed');
        })
      );
    } else {
      // If refresh is already in progress, wait for it to complete
      return this.tokenRefreshService.getRefreshTokenSubject().pipe(
        filter(token => token != null),
        take(1),
        switchMap(token => {
          const newReq = req.clone({
            setHeaders: {
              Authorization: `Bearer ${token}`
            }
          });
          return next.handle(newReq);
        })
      );
    }
  }

  /**
   * Handle authentication errors - logout user
   */
  private handleAuthError(): void {
    console.log('Authentication error - logging out user');
    
    // Clear all stored authentication data
    this.clearAuthData();
    
    // Show error message
    alert('Your session has expired. Please login again.');
    
    // Redirect to login page
    this.router.navigate(['/login']);
  }

  private clearAuthData(): void {
    localStorage.removeItem('token');
    localStorage.removeItem('refreshToken');
    localStorage.removeItem('loginId');
    localStorage.removeItem('role');
    localStorage.removeItem('fname');
    localStorage.removeItem('lname');
    localStorage.removeItem('userid');
    localStorage.removeItem('locale');
    
    console.log('Authentication data cleared');
  }

}