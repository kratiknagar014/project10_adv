import { Component, OnInit } from '@angular/core';
import { ServiceLocatorService } from '../service-locator.service';
import { ActivatedRoute } from '@angular/router';
import { BaseCtl } from '../base.component';
import { HttpServiceService } from '../http-service.service';

@Component({
  selector: 'app-changepassword',
  templateUrl: './changepassword.component.html',
  styleUrls: ['./user.component.css']
})

export class ChangepasswordComponent extends BaseCtl {

  constructor(public locator: ServiceLocatorService, public route: ActivatedRoute, public httpService: HttpServiceService) {
    super(locator.endpoints.USER, locator, route);
  }


  public form = {

    error: false, //error 
    message: null, //error or success message
    preload: [], // preload data
    data: { 
      id: null, 
      loginId: null,
      oldPassword: '',
      newPassword: '',
      confirmPassword: ''
    }, //form data
    inputerror: {
      oldPassword: '',
      newPassword: '',
      confirmPassword: ''
    }, // form input error messages
    searchParams: {}, //search form
    searchMessage: null, //search result message
    list: [], // search list 
    pageNo: 0
  };


  validateForm(form) {
    let flag = true;
    let validator = this.serviceLocator.dataValidator;
    flag = flag && validator.isNotNullObject(form.oldPassword);
    flag = flag && validator.isNotNullObject(form.newPassword);
    flag = flag && validator.isNotNullObject(form.confirmPassword);
    return flag;
  }

  changePassword() {
    var _self = this;
    this.form.data.loginId = localStorage.getItem("loginId")
    this.httpService.post(this.serviceLocator.endpoints.USER + "/changepassword", this.form.data, function (res) {

      if (res.result.inputerror) {
        _self.form.inputerror = res.result.inputerror;
      }

      if (res.result.message) {
        _self.form.message = res.result.message;
      }

    });
  }
}

