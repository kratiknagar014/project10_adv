import { Component, OnDestroy, OnInit } from '@angular/core';
import { Subscription, Observable,timer } from 'rxjs';
import { TranslateService } from '@ngx-translate/core';



@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})

export class AppComponent implements OnInit {
 
  constructor(private translate: TranslateService) {
    // Set default language to English
    this.translate.setDefaultLang('en');
    
    // Use English as the current language
    this.translate.use('en');
    
    // Remove Hindi class from body if present
    document.body.classList.remove('hindi-text');
  }

  ngOnInit() {
    // Ensure English is set on component initialization
    this.translate.use('en');
    document.body.classList.remove('hindi-text');
  }
}




 
