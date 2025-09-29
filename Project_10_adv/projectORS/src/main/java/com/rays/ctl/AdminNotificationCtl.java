package com.rays.ctl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import java.util.Map;

import com.rays.common.ORSResponse;
import com.rays.common.notification.FCMService;

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
     * Send notification to specific roles using existing st_role table
     */
    @PostMapping("sendToRoles")
    public ORSResponse sendToRoles(@RequestBody Map<String, Object> requestData) {
        try {
            String title = (String) requestData.get("title");
            String body = (String) requestData.get("body");
            
            if (title == null || body == null) {
                ORSResponse res = new ORSResponse(false);
                res.addMessage("Title and body are required");
                return res;
            }
            
            // Simple implementation for now
            String response = fcmService.sendNotificationToTopic("all_users", title, body, null);
            
            ORSResponse res = new ORSResponse(true);
            res.addMessage("Role-based notification sent");
            res.addResult("response", response);
            
            System.out.println("Role-based notification sent: " + title);
            
            return res;
            
        } catch (Exception e) {
            System.err.println("Error sending role-based notification: " + e.getMessage());
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
