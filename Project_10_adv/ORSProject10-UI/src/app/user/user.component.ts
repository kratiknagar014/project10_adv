import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup } from '@angular/forms';
import { BaseCtl } from '../base.component';
import { ServiceLocatorService } from '../service-locator.service';
import { ActivatedRoute } from '@angular/router';
import { HttpClient } from '@angular/common/http';


@Component({
  selector: 'app-user',
  templateUrl: './user.component.html',
  styleUrls: ['./user.component.css']
})


export class UserComponent extends BaseCtl {

  getKey = false;
  selected = null;
  fileToUpload: File = null;
  userForm: FormGroup = null;
  uploadForm: FormGroup;

  constructor(public locator: ServiceLocatorService, public route: ActivatedRoute, private httpClient: HttpClient) {
    super(locator.endpoints.USER, locator, route);
  }

  ngOnInit() {
    // Store the ID from route params
    const currentId = this.form.data.id;
    
    // Initialize form data with null values for dropdowns
    this.form.data = {
      id: currentId,
      firstName: '',
      lastName: '',
      loginId: '',
      password: '',
      phone: '',
      alternateMobile: '',
      roleId: null,
      gender: null,
      status: null,
      dob: null,
      imageId: null
    };
    
    // Call parent ngOnInit
    super.ngOnInit();
    
    console.log('User form initialized:', this.form.data);
  }

  /**
   * Override preload to maintain form data initialization
   */
  preload() {
    console.log("User preload start");
    var _self = this;
    
    // Store current form data
    const currentFormData = { ..._self.form.data };
    
    this.serviceLocator.httpService.get(_self.api.preload, function (res) {
      if (res.success) {
        _self.form.preload = res.result;
        
        // Restore form data after preload
        _self.form.data = currentFormData;
        
        console.log('Preload completed, form data restored:', _self.form.data);
      } else {
        _self.form.error = true;
        _self.form.message = res.result.message;
      }
      console.log('FORM after preload', _self.form);
    });
  }

  submit() {
    var _self = this;
    console.log('in submit');
    console.log(this.form);
    console.log(this.form.data);
    this.serviceLocator.httpService.post(this.api.save, this.form.data, function (res) {
      _self.form.message = '';
      _self.form.data.id = res.result.data;
      if (_self.fileToUpload) {
        console.log('rahul');
        _self.myFile();
      }
      if (res.success) {
        _self.form.message = "Data is saved";
        _self.form.data.id = res.result.data;

        console.log(_self.form.data.id);
        console.log("----------Rahul----------.");

      } else {
        _self.form.error = true;
        if (res.result.inputerror) {
          _self.form.inputerror = res.result.inputerror;
        }
        _self.form.message = res.result.message;
      }
      _self.form.data.id = res.result.data;
      console.log('FORM', _self.form);
    });
  }


  onFileSelect(files: FileList) {
    this.fileToUpload = files.item(0);
    console.log(this.fileToUpload);
  }

  /**
   * Handle image loading error - show default image
   */
  onImageError(event: any) {
    console.log('Image loading failed for user:', this.form.data.id, 'imageId:', this.form.data.imageId);
    console.log('Image URL was:', event.target.src);
    // Force show default image by setting imageId to null
    this.form.data.imageId = null;
  }

  /**
   * Handle successful image loading
   */
  onImageLoad(event: any) {
    console.log('Image loaded successfully for user:', this.form.data.id, 'imageId:', this.form.data.imageId);
  }

  onUpload(userform: FormData) {
    this.submit();
    console.log(this.form.data.id + '---- after submit');

  }


  myFile() {
    console.log(this.form.data.id + 'after super.submit-----');
    this.onSubmitProfile(this.fileToUpload, this.userForm).subscribe(data => {

      console.log(this.fileToUpload);
    }, error => {
      console.log(error);
    });

  }

  onSubmitProfile(fileToUpload: File, userform: FormGroup) {
    const formData = new FormData();
    let phone = null;
    formData.append('file', fileToUpload);
    console.log(this.form.data.id + 'this id number ======');
    return this.httpClient.post(this.serviceLocator.endpoints.USER + "/profilePic/" + this.form.data.id, formData);
  }

  validateForm(form) {
    let flag = true;
    let validator = this.serviceLocator.dataValidator;
    flag = flag && validator.isNotNullObject(form.roleId);
    console.log(form.roleId);
    flag = flag && validator.isNotNullObject(form.firstName);
    console.log(form.firstName);
    flag = flag && validator.isNotNullObject(form.lastName);
    console.log(form.lastName);
    flag = flag && validator.isNotNullObject(form.loginId);
    console.log(form.loginId);
    flag = flag && validator.isNotNullObject(form.password);
    console.log(form.password);
    flag = flag && validator.isNotNullObject(form.phone);
    console.log(form.phone);
    flag = flag && validator.isNotNullObject(form.alternateMobile);
    console.log(form.alternateMobile);
    flag = flag && validator.isNotNullObject(form.dob);
    console.log(form.dob);
    flag = flag && validator.isNotNullObject(form.gender);
    console.log(form.gender + 'gender--');
    flag = flag && validator.isNotNullObject(form.status);
    console.log(form.status + 'status---');
    return flag;
  }

  populateForm(form, data) {
    form.id = data.id;
    console.log(form.id + 'populate form in usercomponent');
    form.firstName = data.firstName || '';
    form.lastName = data.lastName || '';
    form.loginId = data.loginId || '';
    form.password = data.password || '';
    form.gender = data.gender || null;
    console.log(form.gender + ' gender--');
    form.alternateMobile = data.alternateMobile || '';
    form.phone = data.phone || '';
    console.log(form.phone);
    form.dob = data.dob || null;
    form.roleId = data.roleId || null;
    form.status = data.status || null;
    form.imageId = data.imageId || null;
    console.log(form.status + 'status---');
  }


  parseDate(dateString: string): Date {
    if (dateString) {
      return new Date(dateString);
    }
    return null;
  }
  test() {

  }

}
