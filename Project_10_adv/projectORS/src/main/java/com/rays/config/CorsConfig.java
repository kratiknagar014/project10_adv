package com.rays.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.lang.NonNull;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

/**
 * Enhanced CORS Configuration with Environment-specific settings
 * 
 * @author Rajat Dhakad
 */
@Configuration
public class CorsConfig {

    @Value("${cors.allowed.origins}")
    private String allowedOrigins;

    @Value("${cors.allowed.methods:GET,POST,PUT,DELETE,OPTIONS,PATCH}")
    private String allowedMethods;

    @Value("${cors.allowed.headers:*}")
    private String allowedHeaders;

    @Value("${cors.allow.credentials:true}")
    private boolean allowCredentials;

    @Value("${cors.max.age:3600}")
    private long maxAge;

    @Bean
    public WebMvcConfigurer corsConfigurer() {
        return new WebMvcConfigurer() {
            @Override
            public void addCorsMappings(@NonNull CorsRegistry registry) {
                String[] origins = allowedOrigins.split(",");
                String[] methods = allowedMethods.split(",");
                String[] headers = allowedHeaders.equals("*") ? 
                    new String[]{"*"} : allowedHeaders.split(",");

                registry.addMapping("/**")
                    .allowedOrigins(origins)
                    .allowedMethods(methods)
                    .allowedHeaders(headers)
                    .allowCredentials(allowCredentials)
                    .maxAge(maxAge)
                    .exposedHeaders("Authorization", "Content-Type", "X-Requested-With", "accept", "Origin", "Access-Control-Request-Method", "Access-Control-Request-Headers");
            }
        };
    }
}
