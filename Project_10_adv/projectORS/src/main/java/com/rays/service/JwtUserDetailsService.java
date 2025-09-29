package com.rays.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.rays.common.BaseServiceImpl;
import com.rays.dao.UserDAOImpl;
import com.rays.dao.UserDAOInt;
import com.rays.dto.UserDTO;


@Service
public class JwtUserDetailsService extends BaseServiceImpl<UserDTO, UserDAOInt> implements UserDetailsService {

	@Autowired
	private UserDAOInt userDao;
	
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		System.out.println(username + " --username is in service ");
		// Try by loginId first (covers email/phone/uid), then fallback to email
		UserDTO user = userDao.findByEmail("loginId", username, null);
		if (user == null) {
			user = userDao.findByEmail("email", username, null);
		}
		System.out.println("After lookup run");
		if (user == null) {
			System.out.println("user not found");
			throw new UsernameNotFoundException("User not found with username: " + username);
		}
		System.out.println("At return statement");
		String pwd = user.getPassword() == null ? "" : user.getPassword();
		return new org.springframework.security.core.userdetails.User(user.getLoginId(), pwd,
				new ArrayList<>());
	}

}