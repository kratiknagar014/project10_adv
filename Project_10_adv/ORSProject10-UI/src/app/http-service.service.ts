import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { CookieService } from 'ngx-cookie-service';
import { Router } from '@angular/router'


@Injectable()

export class HttpServiceService {


  token = '';
  form = {
    message: '',
    error: false
  };


  userparams = {
    url: '',
    sessionExpiredMsg: '',
    methodType: '',
  };


  setToken(token) {
    this.token = localStorage.getItem('token');
    console.log(this.token + '----> inside setToken');
  }

  getToken() {
    console.log(localStorage.getItem('token') + '====>> getToken');
    return localStorage.getItem('token');
  }

  constructor(private router: Router, private httpClient: HttpClient) {

  }


  isLogout() {
    let JSESSIONID = localStorage.getItem('fname');
    let token = localStorage.getItem('token');
    console.log("isLogout check...", { 
      fname: JSESSIONID, 
      token: token ? token.substring(0, 20) + '...' : null,
      currentUrl: this.router.url 
    });

    // Don't check session for public pages or first visit
    const publicPages = ["/login", "/Auth", "/logout", "/forgotpassword", "/signup", "/login/true", "/"];
    const isPublicPage = publicPages.some(page => this.router.url === page || this.router.url.startsWith(page));
    
    if (isPublicPage) {
      return false; // Don't show session expired for public pages
    }

    // Check both fname and token for session validity
    if ((JSESSIONID == "null" || JSESSIONID == null) && (token == "null" || token == null)) {
      // Only show session expired if user was previously logged in
      if (localStorage.getItem('wasLoggedIn') === 'true') {
        console.log("🚨 SESSION EXPIRED DETECTED:");
        console.log("- fname:", JSESSIONID);
        console.log("- token:", token);
        console.log("- wasLoggedIn:", localStorage.getItem('wasLoggedIn'));
        console.log("- Current URL:", this.router.url);
        console.log("- Stack trace:", new Error().stack);
        
        this.form.message = "Your Session has been Expired! Please Re-Login";
        this.form.error = true;
        this.userparams.url = this.router.url;
        localStorage.removeItem('wasLoggedIn'); // Clear flag to prevent repeated alerts
        this.router.navigateByUrl("/login");
        return true;
      }
      return false; // Don't show alert on first visit
    } else {
      localStorage.setItem('wasLoggedIn', 'true'); // Mark user as logged in
      return false;
    }
  }


  get(endpoint, callback) {
    if (this.isLogout()) {
      console.log('inside isLogout() return true');
      return true;
    }
    console.log('httpservice get after logout condition returm');
    return this.httpClient.get(endpoint).subscribe((data) => {
      console.log('Data :: ' + data);
      callback(data);
    }, error => {
      console.log('GET Error--', error);
      this.handleHttpError(error, callback);
    });
  }

  post(endpoint, bean, callback) {
    if (this.isLogout()) {
      console.log('inside isLogout return true')
      return true;
    }
    console.log('httpservice post after logout condition returm');
    return this.httpClient.post(endpoint, bean).subscribe((data) => {
      console.log(data);
      callback(data);
    }, error => {
      console.log('POST Error--', error);
      this.handleHttpError(error, callback);
    });
  }

  /**
   * Handle HTTP errors - but don't auto-logout for all 403s
   */
  private handleHttpError(error: any, callback: any) {
    console.log('HTTP Error Status:', error.status);
    console.log('HTTP Error Message:', error.message);
    
    // Only logout for specific authentication endpoints, not all 403s
    const authEndpoints = ['/Login', '/Auth', '/logout'];
    const isAuthEndpoint = authEndpoints.some(endpoint => error.url && error.url.includes(endpoint));
    
    if (error.status === 401 || (error.status === 403 && isAuthEndpoint)) {
      console.log('403 Forbidden - Access denied');
      console.log('Authentication error - logging out user');
      
      // Clear authentication data
      localStorage.removeItem('token');
      localStorage.removeItem('refreshToken');
      localStorage.removeItem('loginId');
      localStorage.removeItem('role');
      localStorage.removeItem('fname');
      localStorage.removeItem('lname');
      localStorage.removeItem('userid');
      localStorage.removeItem('wasLoggedIn'); // Clear login flag
      console.log('Authentication data cleared');
      
      // Show error message
      this.form.message = "Your session has expired. Please login again.";
      this.form.error = true;
      
      // Redirect to login
      this.router.navigate(['/login']);
      
      // Return error response to callback
      if (callback) {
        callback({
          success: false,
          result: {
            message: "Session expired. Please login again."
          }
        });
      }
    } else {
      // Handle other errors without logging out
      console.log('Non-auth error, not logging out user');
      if (callback) {
        callback({
          success: false,
          result: {
            message: error.status === 403 ? "Access denied" : (error.message || "An error occurred. Please try again.")
          }
        });
      }
    }
  }

}


