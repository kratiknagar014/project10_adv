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
    console.log("isLogout check...");

    // Don't check session for public pages or first visit
    const publicPages = ["/login", "/Auth", "/logout", "/forgotpassword", "/signup", "/login/true", "/"];
    const isPublicPage = publicPages.some(page => this.router.url === page || this.router.url.startsWith(page));
    
    if (isPublicPage) {
      return false; // Don't show session expired for public pages
    }

    if (JSESSIONID == "null" || JSESSIONID == null) {
      this.form.message = "Your Session has been Expired! Please Re-Login";
      this.form.error = true;
      this.userparams.url = this.router.url;// to navigate the URI request.
      this.router.navigateByUrl("/login");
      console.log("Session expired, redirecting to login");

      return true;
    } else {
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
   * Handle HTTP errors - especially 401/403
   */
  private handleHttpError(error: any, callback: any) {
    console.log('Handling HTTP Error:', error);
    
    if (error.status === 401 || error.status === 403) {
      console.log('Authentication error detected in HttpService');
      
      // Clear authentication data
      localStorage.removeItem('token');
      localStorage.removeItem('refreshToken');
      localStorage.removeItem('loginId');
      localStorage.removeItem('role');
      localStorage.removeItem('fname');
      localStorage.removeItem('lname');
      localStorage.removeItem('userid');
      
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
      // Handle other errors
      if (callback) {
        callback({
          success: false,
          result: {
            message: error.message || "An error occurred. Please try again."
          }
        });
      }
    }
  }

}


