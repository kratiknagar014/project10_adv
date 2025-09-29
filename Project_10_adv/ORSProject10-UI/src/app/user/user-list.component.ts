import { Component, OnInit } from '@angular/core';
import { BaseListCtl } from '../base-list.component';
import { ServiceLocatorService } from '../service-locator.service';
import { ActivatedRoute } from '@angular/router';
import { HttpClient } from '@angular/common/http';
import { analyzeAndValidateNgModules } from '@angular/compiler';

@Component({
  selector: 'app-user-list',
  templateUrl: './user-list.component.html',
  styleUrls: ['./user.component.css']
})


export class UserListComponent extends BaseListCtl {
  imageToShow: any;
  myKey = "";
  isLoading = false;

  createImageFromBlob(image: Blob) {
    let reader = new FileReader();
    reader.addEventListener("load", () => {
      this.imageToShow = reader.result;

    }, false);

    if (image) {
      reader.readAsDataURL(image);
    }
  }

  public form = {

    error: false, //error 
    message: null, //error or success message
    preload: {
      roleList: []
    }, // preload data
    data: { id: null }, //form data
    inputerror: {}, // form input error messages
    searchParams: {
      firstName: '',
      roleId: ''
    }, //search form
    searchMessage: null, //search result message
    list: [], // search list 
    pageNo: 0
  };



  selectedFile: File;
  retrievedImage: any;
  base64Data: any;
  retrieveResonse: any;
  message: string;
  imageName: any;


  constructor(public locator: ServiceLocatorService, public route: ActivatedRoute, private httpClient: HttpClient) {
    super(locator.endpoints.USER, locator, route);
  }


  /**
   * Override submit method to add loading state
   */
  submit() {
    this.form.pageNo = 0;
    if (this.form.searchParams.roleId == "undefined") {
      this.form.searchParams = {
        firstName: '',
        roleId: ''
      };
      this.search();
    } else {
      this.search();
    }
  }

  /**
   * Override search method to debug user data
   */
  search() {
    console.log("UserList search start with debug");
    this.isLoading = true;
    this.form.error = false;
    this.form.message = null;
    
    var _self = this;
    console.log("Search Form", _self.form.searchParams);
    
    this.locator.httpService.post(_self.api.search + "/" + _self.form.pageNo, _self.form.searchParams, function (res) {
      _self.isLoading = false;
      
      if (res.success) {
        _self.form.list = res.result.data;
        _self.nextList = res.result.nextList;

        // Debug: Log user data to check imageId values
        console.log('User list data received:', _self.form.list);
        _self.form.list.forEach((user, index) => {
          console.log(`User ${index + 1}:`, {
            id: user.id,
            firstName: user.firstName,
            lastName: user.lastName,
            imageId: user.imageId,
            imageIdType: typeof user.imageId
          });
        });

        if (_self.form.list.length == 0) {
          _self.form.message = "No record found";
          _self.form.error = false;
        }
        console.log("List Size", _self.form.list.length);
      } else {
        _self.form.error = true;
        _self.form.message = res.result.message || "Failed to load users. Please try again.";
        _self.form.list = [];
      }
      console.log('FORM', _self.form);
    });
  }


  getImage(id) {
    //Make a call to Spring Boot to get the Image Bytes.
    this.form.data.id = id;
    console.log(this.form.data.id);

    this.httpClient.get('http://localhost:8084/User/profilePic/' + this.form.data.id, { responseType: 'blob' }).subscribe(data => {
      this.createImageFromBlob(data);
      this.myKey = this.form.data.id;
    }, error => {
      console.log('Image loading error:', error);
    });
  }

  /**
   * Handle image loading error in user list
   */
  onImageError(event: any, user: any) {
    console.log('Image loading failed for user:', user.id, 'imageId:', user.imageId);
    console.log('Image URL was:', event.target.src);
    // Set imageId to null to show default image
    user.imageId = null;
  }

  /**
   * Handle successful image loading
   */
  onImageLoad(event: any, user: any) {
    console.log('Image loaded successfully for user:', user.id, 'imageId:', user.imageId);
  }

}
