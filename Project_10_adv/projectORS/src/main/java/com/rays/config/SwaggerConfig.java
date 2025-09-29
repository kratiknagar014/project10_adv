package com.rays.config;

import java.util.Arrays;
import java.util.List;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.bind.annotation.RestController;

import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.service.ApiKey;
import springfox.documentation.service.AuthorizationScope;
import springfox.documentation.service.Contact;
import springfox.documentation.service.SecurityReference;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spi.service.contexts.SecurityContext;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

/**
 * Swagger Configuration for ORS (Online Result System) API Documentation
 * 
 * This configuration provides comprehensive API documentation with:
 * - Interactive API testing interface
 * - JWT Authentication support
 * - Detailed API information
 * - Professional documentation layout
 * 
 * @author RAYS Technologies
 * @version 1.0
 */
@Configuration
@EnableSwagger2
public class SwaggerConfig {

    /**
     * Main Swagger Docket configuration
     * Configures the API documentation generation
     */
    @Bean
    public Docket api() {
        return new Docket(DocumentationType.SWAGGER_2)
                .apiInfo(apiInfo())
                .securityContexts(Arrays.asList(securityContext()))
                .securitySchemes(Arrays.asList(apiKey()))
                .select()
                .apis(RequestHandlerSelectors.withClassAnnotation(RestController.class))
                .paths(PathSelectors.regex("/.*"))
                .build()
                .pathMapping("/")
                .useDefaultResponseMessages(false);
    }

    /**
     * API Information Configuration
     * Provides detailed information about the API
     */
    private ApiInfo apiInfo() {
        return new ApiInfoBuilder()
                .title("ORS - Online Result System API")
                .description("Comprehensive REST API for Online Result System\n\n" +
                           "🎓 **Features:**\n" +
                           "• Student Management System\n" +
                           "• Faculty & Course Management\n" +
                           "• Marksheet & Result Generation\n" +
                           "• User Authentication & Authorization\n" +
                           "• Role-based Access Control\n" +
                           "• Real-time Data Operations\n\n" +
                           "🔐 **Authentication:**\n" +
                           "This API uses JWT (JSON Web Token) for authentication.\n" +
                           "To access protected endpoints:\n" +
                           "1. Login using /Auth/login endpoint\n" +
                           "2. Copy the JWT token from response\n" +
                           "3. Click 'Authorize' button and enter: Bearer {your-token}\n\n" +
                           "📚 **Getting Started:**\n" +
                           "• Use /Auth/login to authenticate\n" +
                           "• Explore different modules (Student, Faculty, Course, etc.)\n" +
                           "• Test API endpoints directly from this interface\n\n" +
                           "🏢 **Developed by RAYS Technologies**\n" +
                           "Think IT Think Us")
                .version("2.0.0")
                .contact(new Contact(
                    "RAYS Technologies", 
                    "https://www.raystechnologies.com", 
                    "info@raystec.com"
                ))
                .license("MIT License")
                .licenseUrl("https://opensource.org/licenses/MIT")
                .termsOfServiceUrl("https://www.raystechnologies.com/terms")
                .build();
    }

    /**
     * JWT API Key Configuration
     * Enables JWT token authentication in Swagger UI
     */
    private ApiKey apiKey() {
        return new ApiKey("JWT", "Authorization", "header");
    }

    /**
     * Security Context Configuration
     * Defines which endpoints require authentication
     */
    private SecurityContext securityContext() {
        return SecurityContext.builder()
                .securityReferences(defaultAuth())
                .forPaths(PathSelectors.regex("/(?!Auth).*"))
                .build();
    }

    /**
     * Default Authentication Configuration
     * Configures JWT token usage
     */
    private List<SecurityReference> defaultAuth() {
        AuthorizationScope authorizationScope = new AuthorizationScope("global", "accessEverything");
        AuthorizationScope[] authorizationScopes = new AuthorizationScope[1];
        authorizationScopes[0] = authorizationScope;
        return Arrays.asList(new SecurityReference("JWT", authorizationScopes));
    }
}
