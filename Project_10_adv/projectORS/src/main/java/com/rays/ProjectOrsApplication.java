package com.rays;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.core.env.Environment;

import com.rays.common.FrontCtl;

/**
 * Rajat Dhakad
 *
 */

@SpringBootApplication
public class ProjectOrsApplication extends SpringBootServletInitializer {

	@Autowired
	private Environment env;

	@Autowired
	FrontCtl frontCtl;

	public static void main(String []args) {
		SpringApplication.run(ProjectOrsApplication.class, args);

	}

	/**
	 * CORS Configuration moved to CorsConfig.java for better environment management
	 * This method is deprecated in favor of the new CorsConfig class
	 */
	/*
	@Bean
	public WebMvcConfigurer corsConfigurer() {
		// CORS configuration moved to CorsConfig.java
		// This provides environment-specific CORS settings
		return new WebMvcConfigurer() {};
	}
	*/

}
