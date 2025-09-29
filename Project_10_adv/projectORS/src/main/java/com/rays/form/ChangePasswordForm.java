package com.rays.form;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

import com.rays.common.BaseForm;

/**
 * Contains change password form elements and their declarative input validations.
 * Rajat Dhakad 
 */

public class ChangePasswordForm extends BaseForm {

	@NotEmpty(message = "Please enter old password")
	@Size(min = 2, max = 10)
	private String oldPassword;

	@NotEmpty(message = "Please enter new password")
	@Size(min = 2, max = 10)
	private String newPassword;
	
	@NotEmpty(message = "Please enter confirmPassword")
	@Size(min = 2, max = 10)
	private String confirmPassword;
	

	private String loginId; 

	public String getLoginId() {
		return loginId;
	}

	public void setLoginId(String loginId) {
		this.loginId = loginId;
	}

	public String getOldPassword() {
		return oldPassword;
	}

	public void setOldPassword(String oldPassword) {
		this.oldPassword = oldPassword;
	}

	public String getNewPassword() {
		return newPassword;
	}

	public void setNewPassword(String newPassword) {
		this.newPassword = newPassword;
	}
	
	public String getConfirmPassword() {
		return confirmPassword;
	}

	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
	}

}
