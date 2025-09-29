package com.rays.ctl;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.List;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.LinkedHashSet;

import com.rays.common.MenuItem;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import org.apache.tomcat.util.bcel.classfile.EnumElementValue;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.rays.common.BaseCtl;
import com.rays.common.MenuItem;
import com.rays.common.ORSResponse;
import com.rays.common.notification.FCMService;
import com.rays.common.UserContext;
import com.rays.common.attachment.AttachmentDTO;
import com.rays.common.attachment.AttachmentServiceInt;
import com.rays.config.JwtTokenUtil;
import com.rays.config.FirebaseTokenUtil;
import com.rays.dto.RefreshTokenDTO;
import com.rays.dto.UserDTO;
import com.rays.form.LoginForm;
import com.rays.form.UserForm;
import com.rays.form.UserRegistrationForm;
import com.rays.service.RefreshTokenServiceInt;
import com.rays.service.UserServiceInt;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import io.swagger.annotations.ApiResponse;
import io.swagger.annotations.ApiResponses;

/**
 * Authentication Controller for ORS (Online Result System)
 * 
 * Provides comprehensive authentication and user management APIs including:
 * - User Login/Logout
 * - User Registration
 * - Password Management
 * - JWT Token Generation
 * - Firebase Authentication
 * 
 * @author RAYS Technologies
 * @version 2.0
 */
@Api(value = "Authentication Management", 
     description = "APIs for user authentication, registration, and password management")
@RestController
@RequestMapping(value = "Auth")
public class LoginCtl extends BaseCtl<UserForm, UserDTO, UserServiceInt> {

    private static final Logger log = LoggerFactory.getLogger(LoginCtl.class);

    /**
     * Finds user by login id
     * 
     * @param loginId
     * @return
     * 
     */

    @Autowired
    private AuthenticationManager authenticationManager;

    @Autowired
    private JwtTokenUtil jwtTokenUtil;

    @Autowired
    private UserDetailsService jwtService;

    @Autowired
    private RefreshTokenServiceInt refreshTokenService;

    @Autowired
    AttachmentServiceInt attachmentService;

    @Autowired
    private FirebaseTokenUtil firebaseTokenUtil;
    
    @Autowired
    private FCMService fcmService;

    @ApiOperation(value = "Find User by Login ID", 
                  notes = "Retrieves user information by login ID for authentication purposes")
    @ApiResponses(value = {
        @ApiResponse(code = 200, message = "User found successfully"),
        @ApiResponse(code = 404, message = "User not found"),
        @ApiResponse(code = 500, message = "Internal server error")
    })
    @GetMapping("login/{loginId}")
    public ORSResponse get(@ApiParam(value = "User login ID", required = true, example = "user@example.com") 
                          @PathVariable String loginId) {
        ORSResponse res = new ORSResponse(true);
        UserDTO dto = baseService.findByLoginId(loginId, userContext);
        System.out.println("User " + dto);
        if (dto != null) {
            UserDTO userDTO = new UserDTO();
            userDTO.setFirstName(dto.getFirstName());
            userDTO.setLastName(dto.getLastName());
            userDTO.setLoginId(dto.getLoginId());
            res.addData(userDTO);
        } else {
            res.setSuccess(false);
            res.addMessage("Record not found");
        }
        return res;
    }

    @ApiOperation(value = "User Authentication", 
                  notes = "Authenticates user credentials and returns JWT token for secure API access")
    @ApiResponses(value = {
        @ApiResponse(code = 200, message = "Login successful - JWT token generated"),
        @ApiResponse(code = 401, message = "Invalid credentials"),
        @ApiResponse(code = 400, message = "Validation error"),
        @ApiResponse(code = 500, message = "Internal server error")
    })
    @PostMapping("login")
    public ORSResponse login(@ApiParam(value = "User login credentials", required = true) 
                            @RequestBody @Valid LoginForm form, 
                            BindingResult bindingResult, HttpSession session,
                            HttpServletRequest request) throws Exception {
        System.out.println("loginCtl ki login API ko hit kiya");
        ORSResponse res = validate(bindingResult);

        if (!res.isSuccess()) {
            return res;
        }

        UserDTO dto = baseService.authenticate(form.getLoginId(), form.getPassword());
        if (dto == null) {
            System.out.println("dto == null ");
            res.setSuccess(false);
            res.addMessage("Invalid ID or Password");
        } else {
            UserContext context = new UserContext(dto);

            // session.setAttribute("userContext", context);

            session.setAttribute("test", dto.getFirstName());

            res.setSuccess(true);
            res.addData(dto);
            res.addResult("jsessionid", session.getId());
            res.addResult("loginId", dto.getLoginId());
            res.addResult("role", dto.getRoleName());
            res.addResult("fname", dto.getFirstName());
            res.addResult("lname", dto.getLastName());

            /* System.out.println("jsessionid " + session.getId()); */
            System.out.println("Before calling userDetail authenticate");

            final UserDetails userDetails = jwtService.loadUserByUsername(form.getLoginId());

            // Generate access token
            final String accessToken = jwtTokenUtil.generateToken(userDetails);
            
            // Generate refresh token
            RefreshTokenDTO refreshToken = refreshTokenService.createRefreshToken(dto.getId());

            res.addResult("token", accessToken);
            res.addResult("refreshToken", refreshToken.getToken());
            res.addResult("tokenType", "Bearer");
            res.addResult("expiresIn", JwtTokenUtil.JWT_TOKEN_VALIDITY);
            return res;

        }

        return res;
    }

    /**
     * Emails password to user
     * 
     * @return
     */
    @GetMapping("fp/{login}")
    public ORSResponse forgotPassword(@PathVariable String login, HttpServletRequest request) {
        System.out.println("Forget password get run " + login);
        Enumeration<String> e = request.getHeaderNames();

        System.out.println("e :" + e);

        String key = null;
        while (e.hasMoreElements()) {
            key = e.nextElement();
            System.out.println(key + " = " + request.getHeader(key));
        }
        ORSResponse res = new ORSResponse(true);
        UserDTO dto = this.baseService.forgotPassword(login);
        if (dto == null) {
            res.setSuccess(false);
            res.addMessage("Invalid Login Id");
        } else {
            res.setSuccess(true);
            res.addMessage("Password has been sent to email id");
        }
        return res;
    }

    /**
     * Register new user
     * 
     * @param form
     * @param bindingResult
     * @return
     */
    @PostMapping("signUp")
    public ORSResponse signUp(@RequestBody @Valid UserRegistrationForm form, BindingResult bindingResult) {
        System.out.println("Sign Up Called");
        ORSResponse res = validate(bindingResult);

        if (!res.isSuccess()) {
            res.addMessage("Please fill following empty fields");
            return res;
        }

        UserDTO dto = baseService.findByLoginId(form.getLogin(), userContext);

        if (dto != null) {
            res.setSuccess(false);
            res.addMessage("Login Id already exists");
            return res;
        }

        dto = new UserDTO();
        dto.setFirstName(form.getFirstName());
        dto.setLastName(form.getLastName());
        dto.setLoginId(form.getLogin());
        dto.setEmail(form.getLogin());
        dto.setGender(form.getGender());
        dto.setDob(form.getDob());
        System.out.println(form.getDob() + "--->>>>>");
        dto.setPhone(form.getPhone());

        System.out.println(dto.getPhone() + "phone-->>>>>");
        dto.setPassword(form.getPassword());
        System.out.println(dto.getPassword() + "Password--------->>>>>>");
        dto.setStatus("Inactive");
        System.out.println(form.getPhone() + "phone--->>s");
        dto.setAlternateMobile(form.getAlternateMobile());
        System.out.println(dto.getAlternateMobile() + "alternate phone--->");
        dto.setRoleId(2L);

        baseService.register(dto);

        res.setSuccess(true);
        res.addMessage("User has been registered");
        return res;
    }

    @PostMapping("/profilePic/{userId}")
    public ORSResponse uploadPic(@PathVariable Long userId, @RequestParam("file") MultipartFile file,
            HttpServletRequest req) {

        System.out.println("User ID id --------------" + userId);

        UserDTO userDTO = baseService.findById(userId, userContext);

        AttachmentDTO doc = new AttachmentDTO(file);

        doc.setDescription("Profile picture");
        System.out.println(doc.getDescription() + "description");

        doc.setPath(req.getServletPath());
        System.out.println(doc.getPath() + "path-----");
        doc.setUserId(userId);
        System.out.println(doc.getUserId() + "id-----");

        if (userDTO.getImageId() != null && userDTO.getImageId() > 0) {
            doc.setId(userDTO.getImageId());
        }
        System.out.println("before calling save");
        Long imageId = attachmentService.save(doc, userContext);
        System.out.println("after save");
        // Update new image id
        if (userDTO.getImageId() == null || userDTO.getImageId() == 0) {
            userDTO.setImageId(imageId);
            baseService.update(userDTO, userContext);
        }

        ORSResponse res = new ORSResponse();
        res.setSuccess(true);
        res.addResult("imageId", imageId);

        return res;
    }

    @GetMapping("menu")
    public ORSResponse menu(HttpSession session) {

        LinkedHashSet<MenuItem> menuBar = new LinkedHashSet<MenuItem>();

        MenuItem std = new MenuItem("Student", "/student");
        std.addSubmenu("Add Student", "/student");
        std.addSubmenu("Student List", "/studentlist");
        menuBar.add(std);

        MenuItem coll = new MenuItem("College", "/college");
        coll.addSubmenu("Add College", "/college");
        coll.addSubmenu("College List", "/collegelist");
        menuBar.add(coll);

        MenuItem mess = new MenuItem("Message", "/message");
        mess.addSubmenu("Add Message", "/message");
        mess.addSubmenu("Message List", "/messagelist");
        menuBar.add(mess);

        MenuItem user = new MenuItem("User", "/user");
        user.addSubmenu("Add User", "/user");
        user.addSubmenu("User List", "/userlist");
        menuBar.add(user);

        MenuItem marksheet = new MenuItem("Marksheet", "/marksheet");
        marksheet.addSubmenu("Add Marksheet", "/marksheet");
        marksheet.addSubmenu("Marksheet List", "/marksheetlist");
        marksheet.addSubmenu("Marksheet Merit List", "/marksheetmeritlist");
        marksheet.addSubmenu("Get Marksheet", "/getmarksheet");
        menuBar.add(marksheet);

        MenuItem role = new MenuItem("Role", "/role");
        role.addSubmenu("Add Role", "/role");
        role.addSubmenu("User Role", "/rolelist");
        menuBar.add(role);

        MenuItem course = new MenuItem("Course", "/course");
        role.addSubmenu("Add Course", "/course");
        role.addSubmenu("Course List", "/courselist");
        menuBar.add(course);

        MenuItem faculty = new MenuItem("Faculty", "/faculty");
        faculty.addSubmenu("Add Faculty", "/faculty");
        faculty.addSubmenu("Faculty List", "/facultylist");
        menuBar.add(faculty);

        MenuItem timetable = new MenuItem("TimeTable", "/timetable");
        timetable.addSubmenu("Add TimeTable", "/timetable");
        timetable.addSubmenu("TimeTable List", "/timeTablelist");
        menuBar.add(timetable);

        MenuItem subject = new MenuItem("Subject", "/subject");
        subject.addSubmenu("Add Subject", "/subject");
        subject.addSubmenu("Subject List", "/subjectlist");
        menuBar.add(subject);

        MenuItem current = new MenuItem("Current", "/current");
        current.addSubmenu("My Profile", "/myprofile");
        current.addSubmenu("Change Password", "/changepassword");
        current.addSubmenu("Java Doc", "");
        current.addSubmenu("Log out", "");
        menuBar.add(current);

        ORSResponse res = new ORSResponse(true);
        res.addData(menuBar);
        res.setSuccess(true);
        return res;
    }

    @ApiOperation(value = "Firebase Authentication", 
                  notes = "Authenticate user via Firebase (Google/OTP) and return JWT token")
    @ApiResponses(value = {
        @ApiResponse(code = 200, message = "Firebase login successful"),
        @ApiResponse(code = 401, message = "Invalid Firebase token"),
        @ApiResponse(code = 400, message = "Invalid request data"),
        @ApiResponse(code = 500, message = "Internal server error")
    })
    @CrossOrigin(origins = {"http://localhost:4200", "https://project10.live", "https://www.project10.live"})
    @PostMapping("/firebase-login")
    public ResponseEntity<?> firebaseLogin(@RequestBody Map<String, Object> request) {
        try {
            String firebaseToken = (String) request.get("firebaseToken");
            String firebaseUid = (String) request.get("firebaseUid");
            String email = (String) request.get("email");
            String phone = (String) request.get("phone");
            String firstName = (String) request.get("firstName");
            String lastName = (String) request.get("lastName");
            String loginType = (String) request.get("loginType");
            String profilePictureUrl = (String) request.get("profilePicture");

            // Firebase token verify karte hain
            if (!firebaseTokenUtil.verifyToken(firebaseToken)) {
                ORSResponse res = new ORSResponse(false);
                res.addMessage("Invalid Firebase token");
                return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(res);
            }

            UserDTO existingUser = null;

            // User find karte hain by email or phone
            if (email != null && !email.isEmpty()) {
                existingUser = baseService.findByEmail(email, userContext);
            } else if (phone != null && !phone.isEmpty()) {
                existingUser = baseService.findByUniqueKey("phone", phone, userContext);
            }

            if (existingUser != null) {
                // Existing user ko update karte hain
                existingUser.setFirebaseUid(firebaseUid);
                existingUser.setLoginType(loginType);

                // Profile picture handle karte hain using ST_ATTACHMENT table
                if (profilePictureUrl != null && !profilePictureUrl.isEmpty()) {
                    // TODO: Download image from URL and save to ST_ATTACHMENT table.
                    // Skipping remote profile picture storage for now.
                }

                baseService.update(existingUser, userContext);
            } else {
                // New user create karte hain
                existingUser = new UserDTO();
                existingUser.setFirebaseUid(firebaseUid);
                existingUser.setLoginType(loginType);
                existingUser.setEmail(email);
                existingUser.setPhone(phone);
                // Set loginId for compatibility with existing flows (prefer email, else phone, else UID)
                if (email != null && !email.isEmpty()) {
                    existingUser.setLoginId(email);
                } else if (phone != null && !phone.isEmpty()) {
                    existingUser.setLoginId(phone);
                } else {
                    existingUser.setLoginId(firebaseUid);
                }
                existingUser.setFirstName(firstName != null ? firstName : "");
                existingUser.setLastName(lastName != null ? lastName : "");
                existingUser.setRoleId(2L); // Default role

                // Profile picture handle karte hain using ST_ATTACHMENT table
                if (profilePictureUrl != null && !profilePictureUrl.isEmpty()) {
                    // TODO: Download image from URL and save to ST_ATTACHMENT table.
                    // Skipping remote profile picture storage for now.
                }

                baseService.add(existingUser, userContext);
            }

            // Generate backend JWT token for this user
            String usernameForJwt = existingUser.getLoginId();
            if (usernameForJwt == null || usernameForJwt.isEmpty()) {
                if (existingUser.getEmail() != null && !existingUser.getEmail().isEmpty()) {
                    usernameForJwt = existingUser.getEmail();
                } else if (existingUser.getPhone() != null && !existingUser.getPhone().isEmpty()) {
                    usernameForJwt = existingUser.getPhone();
                } else {
                    usernameForJwt = existingUser.getFirebaseUid();
                }
            }
            final UserDetails userDetails = jwtService.loadUserByUsername(usernameForJwt);
            final String backendToken = jwtTokenUtil.generateToken(userDetails);

            // Response prepare karte hain
            ORSResponse res = new ORSResponse(true);
            res.addResult("user", existingUser);
            res.addResult("token", backendToken);
            res.addResult("loginId", existingUser.getLoginId());
            res.addResult("role", existingUser.getRoleName());
            res.addResult("fname", existingUser.getFirstName());
            res.addResult("lname", existingUser.getLastName());
            res.addMessage("Firebase login successful");

            return ResponseEntity.ok(res);

        } catch (Exception e) {
            log.error("Firebase login error", e);
            ORSResponse res = new ORSResponse(false);
            res.addMessage("Firebase login failed: " + e.getMessage());
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(res);
        }
    }

    /**
     * OTP Verification Endpoint
     */
    @ApiOperation(value = "OTP Verification", 
                  notes = "Verify OTP sent via Firebase and authenticate user")
    @ApiResponses(value = {
        @ApiResponse(code = 200, message = "OTP verification successful"),
        @ApiResponse(code = 401, message = "Invalid OTP or phone number"),
        @ApiResponse(code = 400, message = "Invalid request data"),
        @ApiResponse(code = 500, message = "Internal server error")
    })
    @CrossOrigin(origins = {"http://localhost:4200", "https://project10.live", "https://www.project10.live"})
    @PostMapping("/verify-otp")
    public ResponseEntity<?> verifyOtp(@RequestBody Map<String, Object> request) {
        try {
            log.info("OTP verification request received");
            
            String phone = (String) request.get("phone");
            String firebaseToken = (String) request.get("firebaseToken");
            String firstName = (String) request.get("firstName");
            String lastName = (String) request.get("lastName");

            // Validate required fields
            if (phone == null || phone.isEmpty()) {
                ORSResponse res = new ORSResponse(false);
                res.addMessage("Phone number is required");
                return ResponseEntity.badRequest().body(res);
            }

            // Firebase token verify karte hain (if provided)
            if (firebaseToken != null && !firebaseToken.isEmpty()) {
                if (!firebaseTokenUtil.verifyToken(firebaseToken)) {
                    ORSResponse res = new ORSResponse(false);
                    res.addMessage("Invalid Firebase token");
                    return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(res);
                }
            }

            UserDTO existingUser = baseService.findByUniqueKey("phone", phone, userContext);

            if (existingUser != null) {
                // Existing user ko update karte hain
                existingUser.setLoginType("OTP");
                existingUser.setStatus("Active"); // OTP verify होने पर active कर देते हैं
                baseService.update(existingUser, userContext);
            } else {
                // New user create karte hain
                existingUser = new UserDTO();
                existingUser.setPhone(phone);
                existingUser.setLoginId(phone);
                existingUser.setLoginType("OTP");
                existingUser.setFirstName(firstName != null ? firstName : "User");
                existingUser.setLastName(lastName != null ? lastName : "");
                existingUser.setRoleId(2L); // Default role
                existingUser.setStatus("Active");
                
                baseService.add(existingUser, userContext);
            }

            // Generate backend JWT token
            final UserDetails userDetails = jwtService.loadUserByUsername(existingUser.getLoginId());
            final String backendToken = jwtTokenUtil.generateToken(userDetails);
            
            // Generate refresh token
            RefreshTokenDTO refreshToken = refreshTokenService.createRefreshToken(existingUser.getId());

            // Response prepare karte hain
            ORSResponse res = new ORSResponse(true);
            res.addResult("user", existingUser);
            res.addResult("token", backendToken);
            res.addResult("refreshToken", refreshToken.getToken());
            res.addResult("tokenType", "Bearer");
            res.addResult("expiresIn", JwtTokenUtil.JWT_TOKEN_VALIDITY);
            res.addResult("loginId", existingUser.getLoginId());
            res.addResult("role", existingUser.getRoleName());
            res.addResult("fname", existingUser.getFirstName());
            res.addResult("lname", existingUser.getLastName());
            res.addMessage("OTP verification successful");

            return ResponseEntity.ok(res);

        } catch (Exception e) {
            log.error("OTP verification error", e);
            ORSResponse res = new ORSResponse(false);
            res.addMessage("OTP verification failed: " + e.getMessage());
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(res);
        }
    }

    /**
     * Refresh JWT Token using Refresh Token
     */
    @ApiOperation(value = "Refresh JWT Token", 
                  notes = "Generate new JWT access token using refresh token")
    @ApiResponses(value = {
        @ApiResponse(code = 200, message = "Token refreshed successfully"),
        @ApiResponse(code = 401, message = "Invalid or expired refresh token"),
        @ApiResponse(code = 400, message = "Refresh token required")
    })
    @PostMapping("refresh-token")
    public ResponseEntity<ORSResponse> refreshToken(@RequestParam String refreshToken) {
        try {
            // Find and validate refresh token
            RefreshTokenDTO tokenEntity = refreshTokenService.findByToken(refreshToken)
                .orElseThrow(() -> new RuntimeException("Refresh token not found"));

            // Verify token expiration
            tokenEntity = refreshTokenService.verifyExpiration(tokenEntity);

            // Generate new access token
            UserDTO user = tokenEntity.getUser();
            final UserDetails userDetails = jwtService.loadUserByUsername(user.getLoginId());
            final String newAccessToken = jwtTokenUtil.generateToken(userDetails);

            // Create new refresh token (token rotation for security)
            RefreshTokenDTO newRefreshToken = refreshTokenService.rotateRefreshToken(refreshToken);

            ORSResponse res = new ORSResponse(true);
            res.addResult("token", newAccessToken);
            res.addResult("refreshToken", newRefreshToken.getToken());
            res.addResult("tokenType", "Bearer");
            res.addResult("expiresIn", JwtTokenUtil.JWT_TOKEN_VALIDITY);
            res.addMessage("Token refreshed successfully");

            return ResponseEntity.ok(res);

        } catch (Exception e) {
            log.error("Token refresh error", e);
            ORSResponse res = new ORSResponse(false);
            res.addMessage("Token refresh failed: " + e.getMessage());
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(res);
        }
    }

    /**
     * Logout and revoke refresh token
     */
    @ApiOperation(value = "Logout User", 
                  notes = "Logout user and revoke refresh token")
    @PostMapping("logout")
    public ResponseEntity<ORSResponse> logout(@RequestParam(required = false) String refreshToken,
                                            HttpServletRequest request) {
        try {
            // Revoke refresh token if provided
            if (refreshToken != null && !refreshToken.isEmpty()) {
                refreshTokenService.revokeToken(refreshToken);
            }

            // You can also blacklist the access token here if needed
            // For now, we rely on token expiration

            ORSResponse res = new ORSResponse(true);
            res.addMessage("Logout successful");
            return ResponseEntity.ok(res);

        } catch (Exception e) {
            log.error("Logout error", e);
            ORSResponse res = new ORSResponse(false);
            res.addMessage("Logout failed: " + e.getMessage());
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(res);
        }
    }

    /**
     * Revoke all refresh tokens for a user
     */
    @ApiOperation(value = "Revoke All User Tokens", 
                  notes = "Revoke all refresh tokens for the authenticated user")
    @PostMapping("revoke-all-tokens")
    public ResponseEntity<ORSResponse> revokeAllTokens(@RequestParam Long userId) {
        try {
            refreshTokenService.revokeAllUserTokens(userId);

            ORSResponse res = new ORSResponse(true);
            res.addMessage("All tokens revoked successfully");
            return ResponseEntity.ok(res);

        } catch (Exception e) {
            log.error("Token revocation error", e);
            ORSResponse res = new ORSResponse(false);
            res.addMessage("Token revocation failed: " + e.getMessage());
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(res);
        }
    }

    /**
     * Subscribe user to multiple FCM topics for notifications
     */
    @ApiOperation(value = "Subscribe to Topics", 
                  notes = "Subscribe user's FCM token to multiple notification topics based on role")
    @PostMapping("subscribe-topics")
    public ORSResponse subscribeToTopics(@RequestBody Map<String, Object> requestData) {
        try {
            String fcmToken = (String) requestData.get("fcmToken");
            String userId = (String) requestData.get("userId");
            String userRole = (String) requestData.get("userRole");
            @SuppressWarnings("unchecked")
            List<String> topics = (List<String>) requestData.get("topics");
            
            if (fcmToken == null || topics == null || topics.isEmpty()) {
                ORSResponse res = new ORSResponse(false);
                res.addMessage("FCM token and topics are required");
                return res;
            }
            
            // Subscribe to multiple topics using FCM Admin SDK
            List<String> successfulSubscriptions = new ArrayList<>();
            List<String> failedSubscriptions = new ArrayList<>();
            
            for (String topic : topics) {
                String result = fcmService.subscribeToTopic(fcmToken, topic);
                if (result != null) {
                    successfulSubscriptions.add(topic);
                } else {
                    failedSubscriptions.add(topic);
                }
            }
            
            ORSResponse res = new ORSResponse(true);
            res.addMessage("Subscription completed");
            res.addResult("successfulTopics", successfulSubscriptions);
            res.addResult("failedTopics", failedSubscriptions);
            res.addResult("userRole", userRole);
            
            // Log subscription for debugging
            System.out.println("User " + userId + " (Role: " + userRole + ") subscribed to topics:");
            System.out.println("Successful: " + successfulSubscriptions);
            System.out.println("Failed: " + failedSubscriptions);
            System.out.println("FCM Token: " + fcmToken.substring(0, 20) + "...");
            
            return res;
            
        } catch (Exception e) {
            System.err.println("Error subscribing to topics: " + e.getMessage());
            e.printStackTrace();
            ORSResponse res = new ORSResponse(false);
            res.addMessage("Error: " + e.getMessage());
            return res;
        }
    }
}
