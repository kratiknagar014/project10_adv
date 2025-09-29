import { Component, OnInit } from '@angular/core';
import { FormGroup, FormControl } from '@angular/forms';
import { HttpServiceService } from '../http-service.service';
import { Router } from '@angular/router';
import { DataValidator } from '../utility/data-validator';
import { ServiceLocatorService } from '../service-locator.service';


@Component({
  selector: 'app-forgot-password',
  templateUrl: './forgotpassword.component.html'
})

export class ForgotPasswordComponent implements OnInit {

  endpoint = this.serviceLocator.endpoints.SERVER_URL + "/Auth";

  form = {
    error: false,
    message: "",
    data: {
      loginId: ''
    },
    inputerror: {
      loginId: ''
    }
  };

  inputerror = {};
  message = '';

  constructor(private httpService: HttpServiceService, private dataValidator: DataValidator, private router: Router, private serviceLocator: ServiceLocatorService) {
  }


  validate(){
    let flag = true;
    flag = flag && this.dataValidator.isNotNull(this.form.data.loginId);
    return flag;
  }

  /**
   * Initialize component
   */
  ngOnInit() {
  }

  submit() {
    var _self = this;
    this.httpService.get(_self.endpoint + "/fp/"+ this.form.data.loginId ,function (res) {

      console.log('MyResponse', res);

      _self.form.message = '';
      _self.inputerror = {};
          console.log(res.result.message+'------>msg');
      if (res.result.message) {
        _self.form.message = res.result.message;
        console.log(_self.form.message+'-------> msg in sucess');
      
      }

      _self.form.error = !res.success;
      console.log(_self.form.error + '-----------> msg in self.form.error in res');

      if (_self.form.error && res.result.inputerror) {
          _self.inputerror = res.result.inputerror;
          console.log(_self.inputerror + '-----------> msg in self.form.error');
      }
    });
  }
}
