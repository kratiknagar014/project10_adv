package com.rays.ctl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.rays.common.ORSResponse;
import com.rays.common.UserContext;
import com.rays.dto.UserDTO;
import com.rays.service.UserServiceInt;

/**
 * FCM Token Management Controller
 * Handles FCM token storage and retrieval for notification system
 * 
 * @author ORS Team
 */
@RestController
@RequestMapping(value = "NotificationToken")
public class NotificationTokenCtl {

    @Autowired
    private UserServiceInt userService;

    /**
     * Update FCM token for logged-in user
     */
    @PostMapping("updateToken")
    public ORSResponse updateFCMToken(@RequestBody Map<String, Object> requestData) {
        try {
            Long userId = Long.parseLong(requestData.get("userId").toString());
            String fcmToken = (String) requestData.get("fcmToken");
            String userRole = (String) requestData.get("userRole");
            
            if (userId == null || fcmToken == null || fcmToken.trim().isEmpty()) {
                ORSResponse res = new ORSResponse(false);
                res.addMessage("User ID and FCM token are required");
                return res;
            }
            
            // Get user from database
            UserDTO user = userService.findById(userId.longValue(), new UserContext());
            if (user == null) {
                ORSResponse res = new ORSResponse(false);
                res.addMessage("User not found");
                return res;
            }
            
            // Update FCM token
            user.setFcmToken(fcmToken);
            userService.update(user, new UserContext());
            
            ORSResponse res = new ORSResponse(true);
            res.addMessage("FCM token updated successfully");
            res.addResult("userId", userId);
            res.addResult("userRole", userRole);
            res.addResult("tokenLength", fcmToken.length());
            
            // Log for debugging
            System.out.println("🔔 FCM Token updated for user:");
            System.out.println("User ID: " + userId);
            System.out.println("Role: " + userRole + " (ID: " + user.getRoleId() + ")");
            System.out.println("Token: " + fcmToken.substring(0, Math.min(20, fcmToken.length())) + "...");
            
            return res;
            
        } catch (Exception e) {
            System.err.println("Error updating FCM token: " + e.getMessage());
            e.printStackTrace();
            ORSResponse res = new ORSResponse(false);
            res.addMessage("Error: " + e.getMessage());
            return res;
        }
    }

    /**
     * Get all users with FCM tokens for a specific role
     */
    @GetMapping("getUsersByRole")
    public ORSResponse getUsersByRole(@RequestParam Long roleId) {
        try {
            // Create search criteria for users with specific role and FCM token
            UserDTO searchUser = new UserDTO();
            searchUser.setRoleId(roleId);
            
            @SuppressWarnings("unchecked")
            List<UserDTO> users = (List<UserDTO>) userService.search(searchUser, 0, 1000, new UserContext());
            
            // Filter users who have FCM tokens
            int usersWithTokens = 0;
            for (UserDTO user : users) {
                if (user.getFcmToken() != null && !user.getFcmToken().trim().isEmpty()) {
                    usersWithTokens++;
                }
            }
            
            ORSResponse res = new ORSResponse(true);
            res.addMessage("Users retrieved successfully");
            res.addResult("totalUsers", users.size());
            res.addResult("usersWithTokens", usersWithTokens);
            res.addResult("roleId", roleId);
            
            System.out.println("📊 Role " + roleId + " has " + usersWithTokens + " users with FCM tokens out of " + users.size() + " total users");
            
            return res;
            
        } catch (Exception e) {
            System.err.println("Error getting users by role: " + e.getMessage());
            e.printStackTrace();
            ORSResponse res = new ORSResponse(false);
            res.addMessage("Error: " + e.getMessage());
            return res;
        }
    }

    /**
     * Get notification statistics
     */
    @GetMapping("stats")
    public ORSResponse getNotificationStats() {
        try {
            Map<String, Object> stats = new HashMap<>();
            
            // Get users for each role
            for (long roleId = 1; roleId <= 4; roleId++) {
                UserDTO searchUser = new UserDTO();
                searchUser.setRoleId(roleId);
                
                @SuppressWarnings("unchecked")
            List<UserDTO> users = (List<UserDTO>) userService.search(searchUser, 0, 1000, new UserContext());
                int usersWithTokens = 0;
                
                for (UserDTO user : users) {
                    if (user.getFcmToken() != null && !user.getFcmToken().trim().isEmpty()) {
                        usersWithTokens++;
                    }
                }
                
                Map<String, Integer> roleStats = new HashMap<>();
                roleStats.put("totalUsers", users.size());
                roleStats.put("usersWithTokens", usersWithTokens);
                
                String roleName = getRoleName(roleId);
                stats.put(roleName, roleStats);
            }
            
            ORSResponse res = new ORSResponse(true);
            res.addMessage("Notification statistics retrieved");
            res.addResult("stats", stats);
            
            return res;
            
        } catch (Exception e) {
            System.err.println("Error getting notification stats: " + e.getMessage());
            e.printStackTrace();
            ORSResponse res = new ORSResponse(false);
            res.addMessage("Error: " + e.getMessage());
            return res;
        }
    }
    
    private String getRoleName(long roleId) {
        switch ((int) roleId) {
            case 1: return "Admin";
            case 2: return "Student";
            case 3: return "Faculty";
            case 4: return "College";
            default: return "Role" + roleId;
        }
    }
}
