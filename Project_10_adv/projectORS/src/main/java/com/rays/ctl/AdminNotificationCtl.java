package com.rays.ctl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import java.util.Map;
import java.util.List;
import java.util.ArrayList;

import com.rays.common.ORSResponse;
import com.rays.common.DropdownList;
import com.rays.common.UserContext;
import com.rays.common.notification.FCMService;
import com.rays.dto.RoleDTO;
import com.rays.dto.UserDTO;
import com.rays.service.RoleServiceInt;
import com.rays.service.UserServiceInt;

/**
 * Admin Notification Controller
 * Simple controller for admin to send notifications
 * 
 * @author ORS Team
 */
@RestController
@RequestMapping(value = "AdminNotification")
public class AdminNotificationCtl {

    @Autowired
    private FCMService fcmService;
    
    @Autowired
    private RoleServiceInt roleService;
    
    @Autowired
    private UserServiceInt userService;

    /**
     * Test FCM notification
     */
    @GetMapping("sendTest")
    public ORSResponse testNotification(@RequestParam String fcmToken, @RequestParam String title, @RequestParam String body) {
        
        try {
            String response = fcmService.sendNotificationToUser(fcmToken, title, body, null);
            if (response != null) {
                ORSResponse res = new ORSResponse(true);
                res.addMessage("Test notification sent successfully");
                res.addData(response);
                return res;
            } else {
                ORSResponse res = new ORSResponse(false);
                res.addMessage("Failed to send test notification");
                return res;
            }
        } catch (Exception e) {
            ORSResponse res = new ORSResponse(false);
            res.addMessage("Error: " + e.getMessage());
            return res;
        }
    }

    /**
     * Send notification to all users (broadcast via topic)
     */
    @GetMapping("broadcast")
    public ORSResponse broadcastNotification(
            @RequestParam String title, 
            @RequestParam String body) {
        
        try {
            // Send notification to all_users topic
            String response = fcmService.sendNotificationToTopic("all_users", title, body, null);
            
            if (response != null) {
                ORSResponse res = new ORSResponse(true);
                res.addMessage("Broadcast notification sent successfully to all users");
                res.addData(response);
                
                // Log for debugging
                System.out.println("Broadcast notification sent:");
                System.out.println("Title: " + title);
                System.out.println("Body: " + body);
                System.out.println("Topic: all_users");
                
                return res;
            } else {
                ORSResponse res = new ORSResponse(false);
                res.addMessage("Failed to send broadcast notification");
                return res;
            }
        } catch (Exception e) {
            ORSResponse res = new ORSResponse(false);
            res.addMessage("Error: " + e.getMessage());
            return res;
        }
    }

    /**
     * Get dynamic roles for admin UI
     */
    @GetMapping("preload")
    public ORSResponse preload() {
        try {
            System.out.println("🔄 Loading dynamic roles for admin notification...");
            ORSResponse res = new ORSResponse(true);
            
            // Get all active roles from st_role table
            RoleDTO dto = new RoleDTO();
            dto.setStatus(RoleDTO.ACTIVE);
            List<DropdownList> roleList = roleService.search(dto, new UserContext());
            
            res.addResult("roleList", roleList);
            res.addMessage("Roles loaded successfully");
            
            System.out.println("✅ Loaded " + roleList.size() + " active roles");
            for (DropdownList role : roleList) {
                System.out.println("   - Role: " + role.getKey() + " = " + role.getValue());
            }
            
            return res;
            
        } catch (Exception e) {
            System.err.println("❌ Error loading roles: " + e.getMessage());
            e.printStackTrace();
            ORSResponse res = new ORSResponse(false);
            res.addMessage("Error loading roles: " + e.getMessage());
            return res;
        }
    }

    /**
     * Send notification to specific roles using dynamic role selection
     */
    @PostMapping("sendToRoles")
    public ORSResponse sendToRoles(@RequestBody Map<String, Object> requestData) {
        try {
            String title = (String) requestData.get("title");
            String body = (String) requestData.get("body");
            @SuppressWarnings("unchecked")
            List<String> selectedRoleIds = (List<String>) requestData.get("selectedRoles");
            
            if (title == null || body == null) {
                ORSResponse res = new ORSResponse(false);
                res.addMessage("Title and body are required");
                return res;
            }
            
            if (selectedRoleIds == null || selectedRoleIds.isEmpty()) {
                ORSResponse res = new ORSResponse(false);
                res.addMessage("At least one role must be selected");
                return res;
            }
            
            System.out.println("🎯 Sending role-based notification:");
            System.out.println("   Title: " + title);
            System.out.println("   Body: " + body);
            System.out.println("   Target Roles: " + selectedRoleIds);
            
            int totalNotificationsSent = 0;
            List<String> sentToRoles = new ArrayList<>();
            
            // Send to each selected role via topic
            for (String roleIdStr : selectedRoleIds) {
                try {
                    Long roleId = Long.parseLong(roleIdStr);
                    
                    // Get role name for logging
                    RoleDTO role = roleService.findById(roleId, new UserContext());
                    String roleName = (role != null) ? role.getName() : "Role" + roleId;
                    
                    // Send to role-specific topic
                    String topicName = "role_" + roleId;
                    String response = fcmService.sendNotificationToTopic(topicName, title, body, null);
                    
                    if (response != null) {
                        totalNotificationsSent++;
                        sentToRoles.add(roleName);
                        System.out.println("✅ Sent to " + roleName + " (topic: " + topicName + ")");
                    } else {
                        System.out.println("❌ Failed to send to " + roleName);
                    }
                    
                } catch (NumberFormatException e) {
                    System.err.println("❌ Invalid role ID: " + roleIdStr);
                }
            }
            
            ORSResponse res = new ORSResponse(true);
            res.addMessage("Role-based notification sent to " + totalNotificationsSent + " role(s)");
            res.addResult("sentToRoles", sentToRoles);
            res.addResult("totalSent", totalNotificationsSent);
            
            System.out.println("📊 Notification Summary:");
            System.out.println("   Total roles targeted: " + selectedRoleIds.size());
            System.out.println("   Successfully sent to: " + totalNotificationsSent);
            System.out.println("   Roles: " + sentToRoles);
            
            return res;
            
        } catch (Exception e) {
            System.err.println("❌ Error sending role-based notification: " + e.getMessage());
            e.printStackTrace();
            ORSResponse res = new ORSResponse(false);
            res.addMessage("Error: " + e.getMessage());
            return res;
        }
    }

    /**
     * Get basic info
     */
    @PostMapping
    public ORSResponse info() {
        ORSResponse res = new ORSResponse(true);
        res.addMessage("Admin Notification Controller is ready");
        res.addResult("endpoints", "Available: /sendTest, /broadcast, /sendToRoles");
        return res;
    }
}
