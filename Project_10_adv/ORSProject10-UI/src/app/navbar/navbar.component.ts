import { Component, OnInit, OnDestroy } from '@angular/core';
import { Router } from '@angular/router';
import { HttpServiceService } from '../http-service.service';
import { CookieService } from 'ngx-cookie-service';
import { ActivatedRoute } from '@angular/router';
import { HttpClient } from '@angular/common/http';
import { TranslateService } from '@ngx-translate/core';
import { ServiceLocatorService } from '../service-locator.service';
import { environment } from '../../environments/environment';
import { NotificationService, Notification } from '../service/notification.service';
import { FirebaseService } from '../firebase.service';
import { Subscription } from 'rxjs';

@Component({
  selector: 'app-navbar',
  templateUrl: './navbar.component.html',
  styleUrls: ['./navbar.component.css']
})
export class NavbarComponent implements OnInit, OnDestroy {
  loginId: string;
  userid: string;
  mobileMenuOpen = false;
  activeDropdown: string | null = null;
  currentLanguage: string = 'en';

  // Notification properties
  notifications: Notification[] = [];
  unreadCount: number = 0;
  private subscriptions: Subscription[] = [];

  constructor(
    private translate: TranslateService, 
    private route: ActivatedRoute, 
    private httpService: HttpServiceService, 
    private myservice: HttpClient, 
    private servicelocator: ServiceLocatorService,
    private notificationService: NotificationService,
    private firebaseService: FirebaseService
  ) {

    // Force default language to English
    this.currentLanguage = "en";
    translate.setDefaultLang("en");
    translate.use("en");
    localStorage.setItem("locale", "en");
    
    // Remove Hindi class from body to ensure English is default
    document.body.classList.remove('hindi-text');
    
    console.log('Default language set to English');

  }

  changeLocale(locale: string) {
    localStorage.setItem("locale", locale);
    this.translate.use(localStorage.getItem("locale"));
    this.currentLanguage = locale;
    console.log('Locale ' + locale);
    
    // Add/remove Hindi font class to body
    if (locale === 'hi') {
      document.body.classList.add('hindi-text');
    } else {
      document.body.classList.remove('hindi-text');
    }
  }

  public form = {

    error: false, //error 
    message: null, //error or success message
    firstName: null,
    data: { id: null, fname: null, lname: null, role: null, loginId: null }, //form data
    inputerror: {}, // form input error messages
    searchParams: {}, //search form
    searchMessage: null, //search result message
    list: [], // search list 

  };
  
  ngOnInit() {
    // Force English as default language on page load
    this.currentLanguage = 'en';
    this.translate.use('en');
    localStorage.setItem("locale", "en");
    document.body.classList.remove('hindi-text');
    
    console.log('ngOnInit: Default language set to English');

    // Initialize notifications if user is logged in
    if (this.isLogin()) {
      this.initializeNotifications();
    }

    // Close dropdowns when clicking outside
    document.addEventListener('click', (event) => {
      const target = event.target as HTMLElement;
      if (!target.closest('.nav-item-modern')) {
        this.closeAllDropdowns();
      }
    });
  }

  ngOnDestroy() {
    // Clean up event listener
    document.removeEventListener('click', this.closeAllDropdowns);
    
    // Unsubscribe from all subscriptions
    this.subscriptions.forEach(sub => sub.unsubscribe());
  }

  // Initialize notifications
  private initializeNotifications() {
    // Subscribe to unread count
    const unreadSub = this.notificationService.unreadCount$.subscribe(count => {
      this.unreadCount = count;
    });
    this.subscriptions.push(unreadSub);

    // Subscribe to notifications list
    const notificationsSub = this.notificationService.notifications$.subscribe(notifications => {
      this.notifications = notifications;
    });
    this.subscriptions.push(notificationsSub);

    // Add small delay to ensure user session is fully established before loading notifications
    setTimeout(() => {
      // Load initial data with error handling
      this.notificationService.loadUnreadCount();
      this.notificationService.loadNotifications();
    }, 1000);

    // Note: FCM token collection is handled in login component only
    // No need to request permission again in navbar
  }

  // FCM token collection is now handled centrally in login component

  // Mark notification as read
  markAsRead(notificationId: number) {
    this.notificationService.markNotificationAsRead(notificationId);
  }

  // Mark all notifications as read
  markAllAsRead() {
    this.notificationService.markAllNotificationsAsRead();
  }

  // Get time ago string
  getTimeAgo(date: Date): string {
    if (!date) return '';
    
    const now = new Date();
    const notificationDate = new Date(date);
    const diffInMs = now.getTime() - notificationDate.getTime();
    const diffInMinutes = Math.floor(diffInMs / (1000 * 60));
    const diffInHours = Math.floor(diffInMinutes / 60);
    const diffInDays = Math.floor(diffInHours / 24);

    if (diffInMinutes < 1) {
      return 'Just now';
    } else if (diffInMinutes < 60) {
      return `${diffInMinutes}m ago`;
    } else if (diffInHours < 24) {
      return `${diffInHours}h ago`;
    } else if (diffInDays < 7) {
      return `${diffInDays}d ago`;
    } else {
      return notificationDate.toLocaleDateString();
    }
  }

  toggleMobileMenu() {
    this.mobileMenuOpen = !this.mobileMenuOpen;
    // Close all dropdowns when toggling mobile menu
    if (this.mobileMenuOpen) {
      this.closeAllDropdowns();
    }
  }

  toggleDropdown(event: Event, dropdownId: string) {
    event.preventDefault();
    event.stopPropagation();

    const dropdownMenu = document.getElementById(dropdownId + 'Menu');
    const parentItem = (event.target as HTMLElement).closest('.nav-item-modern');
    
    if (!dropdownMenu || !parentItem) return;

    // Check if this dropdown is currently active
    const isCurrentlyActive = this.activeDropdown === dropdownId;

    // Close all dropdowns first
    this.closeAllDropdowns();

    // If it wasn't active, open this one
    if (!isCurrentlyActive) {
      this.activeDropdown = dropdownId;
      dropdownMenu.classList.add('show');
      parentItem.classList.add('active');
      
      // Show overlay for mobile
      const overlay = document.querySelector('.navbar-overlay');
      if (overlay) {
        overlay.classList.add('show');
      }
    }
  }

  closeAllDropdowns() {
    // Close all dropdown menus
    const allDropdowns = document.querySelectorAll('.dropdown-menu-modern');
    allDropdowns.forEach(dropdown => {
      dropdown.classList.remove('show');
    });

    // Remove active class from all nav items
    const allNavItems = document.querySelectorAll('.nav-item-modern');
    allNavItems.forEach(item => {
      item.classList.remove('active');
    });

    // Hide overlay
    const overlay = document.querySelector('.navbar-overlay');
    if (overlay) {
      overlay.classList.remove('show');
    }

    this.activeDropdown = null;
  }

  forward() {
    this.userid = localStorage.getItem("userid");
    console.log('UID---' + this.userid)

    this.servicelocator.forward("/user/" + this.userid);

  }


  isLogin() {
    let check = localStorage.getItem('fname');
    if (check != "null" && check != null) {
      this.form.data.fname = localStorage.getItem("fname");
      this.form.data.lname = localStorage.getItem("lname");
      this.form.data.loginId = localStorage.getItem("loginId");
      this.form.data.role = localStorage.getItem("role");
      // console.log('fname is ---->>>' + this.form.data.fname);
      return true;
    } else {
      return false;
    }
  }


  goToLink() {
    window.open('assets/doc/index.html', '_blank');
  }

  openSwaggerUI() {
    window.open(environment.swaggerUrl, '_blank');
  }

  logout() {
    var _self = this;

    console.log('Logout', this.form);

    // let url = this.servicelocator.endpoints.getEndpoint(this.servicelocator.endpoints.AUTH, "logout");

    // this.servicelocator.httpService.post(url, this.form, function (res, error) {

    //   if (error) {
    //     alert(error);
    //     return;
    //   }
    //   _self.loginId = "null";
    //   localStorage.removeItem("token");
    //   localStorage.removeItem("fname");
    //   localStorage.removeItem("lname");
    //   localStorage.removeItem("loginId");
    //   localStorage.removeItem("role")



    //   console.log('After logout jsessionid---' +localStorage.getItem("JSESSIONID") + "  logout Pushpendra Singh Kushwah");



    //   this.form.message = "Logout Successfully";
    //   console.log(this.form.message);
    //  _self.servicelocator.router.navigateByUrl('/login/true');
    _self.httpService.get(_self.servicelocator.endpoints.USER + "/logout", function (res) {
      _self.servicelocator.router.navigateByUrl('/login/true');
      if (res.success) {
        localStorage.clear();
        _self.form.message = res.result.message;
        //     _self.form.list = res.result.data;
        //     localStorage.removeItem("JSESSIONID");
        //     _self.servicelocator.router.navigateByUrl('/login');
        //     if(_self.form.list.length == 0){
        //       _self.form.message = "No record found";
        //       _self.form.error = true;
        //     }
        //     console.log("List Size",_self.form.list.length );
        //   }else{
        //     _self.form.error = false;
        //     _self.form.message = res.result.message;
        //   }
        //   console.log('FORM', _self.form);
      };

    });

  }
}