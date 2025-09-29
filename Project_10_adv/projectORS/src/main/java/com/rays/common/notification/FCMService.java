package com.rays.common.notification;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Service;

import com.google.auth.oauth2.GoogleCredentials;
import com.google.firebase.FirebaseApp;
import com.google.firebase.FirebaseOptions;
import com.google.firebase.messaging.AndroidConfig;
import com.google.firebase.messaging.AndroidNotification;
import com.google.firebase.messaging.ApnsConfig;
import com.google.firebase.messaging.Aps;
import com.google.firebase.messaging.FirebaseMessaging;
import com.google.firebase.messaging.Message;
import com.google.firebase.messaging.MulticastMessage;
import com.google.firebase.messaging.Notification;
import com.google.firebase.messaging.TopicManagementResponse;
import java.util.Arrays;
import com.google.firebase.messaging.WebpushConfig;
import com.google.firebase.messaging.WebpushNotification;
import com.rays.common.UserContext;

/**
 * Firebase Cloud Messaging Service
 * Handles sending push notifications to users
 * 
 * @author ORS Team
 */
@Service
public class FCMService {

    @Autowired
    private NotificationServiceInt notificationService;

    /**
     * Initialize Firebase Admin SDK
     */
    @PostConstruct
    public void initialize() {
        try {
            if (FirebaseApp.getApps().isEmpty()) {
                ClassPathResource serviceAccount = new ClassPathResource("firebase-service-account.json");
                
                FirebaseOptions options = new FirebaseOptions.Builder()
                    .setCredentials(GoogleCredentials.fromStream(serviceAccount.getInputStream()))
                    .build();

                FirebaseApp.initializeApp(options);
                System.out.println("Firebase Admin SDK initialized successfully");
            }
        } catch (IOException e) {
            System.err.println("Failed to initialize Firebase Admin SDK: " + e.getMessage());
            // For development, continue without Firebase if service account is not available
        }
    }
    /**
     * Send notification to a single user
     */
    public String sendNotificationToUser(String fcmToken, String title, String body, Map<String, String> data) {
        try {
            System.out.println("Sending notification to token: " + fcmToken);
            
            // Check if it's a demo token (for testing without real FCM)
            if (fcmToken != null && fcmToken.startsWith("demo_token_")) {
                System.out.println("Demo token detected - simulating notification send");
                String simulatedResponse = "demo_message_id_" + System.currentTimeMillis();
                System.out.println("Simulated notification sent successfully: " + simulatedResponse);
                System.out.println("Title: " + title);
                System.out.println("Body: " + body);
                return simulatedResponse;
            }
            
            // Build the message for real FCM token
            Message.Builder messageBuilder = Message.builder()
                .setToken(fcmToken)
                .setNotification(Notification.builder()
                    .setTitle(title)
                    .setBody(body)
                    .build());
            
            // Add data if provided
            if (data != null && !data.isEmpty()) {
                messageBuilder.putAllData(data);
            }
            
            Message message = messageBuilder.build();
            
            // Send the message
            String response = FirebaseMessaging.getInstance().send(message);
            System.out.println("Successfully sent message: " + response);
            
            return response;
        } catch (Exception e) {
            System.err.println("Error sending notification: " + e.getMessage());
            e.printStackTrace();
            return null;
        }
    }

    /**
     * Subscribe FCM token to a topic
     */
    public String subscribeToTopic(String fcmToken, String topic) {
        try {
            System.out.println("Subscribing token to topic: " + topic);
            
            // Check if it's a demo token
            if (fcmToken != null && fcmToken.startsWith("demo_token_")) {
                System.out.println("Demo token detected - simulating topic subscription");
                String simulatedResponse = "demo_subscription_" + System.currentTimeMillis();
                System.out.println("Simulated subscription successful: " + simulatedResponse);
                return simulatedResponse;
            }
            
            // Subscribe real FCM token to topic
            List<String> tokens = Arrays.asList(fcmToken);
            TopicManagementResponse response = FirebaseMessaging.getInstance().subscribeToTopic(tokens, topic);
            
            System.out.println("Successfully subscribed to topic: " + topic);
            System.out.println("Success count: " + response.getSuccessCount());
            System.out.println("Failure count: " + response.getFailureCount());
            
            if (response.getSuccessCount() > 0) {
                return "subscription_success_" + System.currentTimeMillis();
            } else {
                System.err.println("Failed to subscribe to topic");
                return null;
            }
            
        } catch (Exception e) {
            System.err.println("Error subscribing to topic: " + e.getMessage());
            e.printStackTrace();
            return null;
        }
    }

    /**
     * Send notification to topic (for admin broadcast)
     */
    public String sendNotificationToTopic(String topic, String title, String body, Map<String, String> data) {
        try {
            System.out.println("Sending notification to topic: " + topic);
            
            // Build the message for topic
            Message.Builder messageBuilder = Message.builder()
                .setTopic(topic)
                .setNotification(Notification.builder()
                    .setTitle(title)
                    .setBody(body)
                    .build());
            
            // Add data if provided
            if (data != null && !data.isEmpty()) {
                messageBuilder.putAllData(data);
            }
            
            Message message = messageBuilder.build();
            
            // Send the message
            String response = FirebaseMessaging.getInstance().send(message);
            System.out.println("Successfully sent topic message: " + response);
            
            return response;
        } catch (Exception e) {
            System.err.println("Error sending topic notification: " + e.getMessage());
            e.printStackTrace();
            return null;
        }
    }

    /**
     * Send notification to multiple users by tokens
     */
    public void sendNotificationToMultipleUsers(List<String> fcmTokens, String title, String body, Map<String, String> data) {
        try {
            if (fcmTokens == null || fcmTokens.isEmpty()) {
                System.out.println("No FCM tokens provided");
                return;
            }

            // Create notification
            Notification notification = Notification.builder()
                .setTitle(title)
                .setBody(body)
                .build();

            // Create multicast message
            MulticastMessage.Builder messageBuilder = MulticastMessage.builder()
                .addAllTokens(fcmTokens)
                .setNotification(notification);

            // Add data payload if provided
            if (data != null && !data.isEmpty()) {
                messageBuilder.putAllData(data);
            }

            // Add platform-specific configurations
            messageBuilder.setAndroidConfig(getAndroidConfig(title, body))
                         .setApnsConfig(getApnsConfig(title, body))
                         .setWebpushConfig(getWebpushConfig(title, body));

            MulticastMessage message = messageBuilder.build();

            // Send message
            var response = FirebaseMessaging.getInstance().sendMulticast(message);
            System.out.println("Successfully sent " + response.getSuccessCount() + " messages");
            
            if (response.getFailureCount() > 0) {
                System.out.println("Failed to send " + response.getFailureCount() + " messages");
            }

        } catch (Exception e) {
            System.err.println("Error sending multicast FCM message: " + e.getMessage());
        }
    }

    /**
     * Send notification to multiple users by tokens
     */
    public void sendBulkNotification(List<String> fcmTokens, String title, String body, UserContext userContext) {
        try {
            if (fcmTokens == null || fcmTokens.isEmpty()) {
                System.out.println("No FCM tokens provided");
                return;
            }

            // Create data payload
            Map<String, String> data = new HashMap<>();
            data.put("type", "bulk_notification");
            data.put("timestamp", String.valueOf(System.currentTimeMillis()));

            // Send notifications
            sendNotificationToMultipleUsers(fcmTokens, title, body, data);

        } catch (Exception e) {
            System.err.println("Error sending bulk notification: " + e.getMessage());
        }
    }

    /**
     * Save notification record to database
     */
    private void saveNotificationRecord(String title, String body, Long senderId, String senderName,
                                      Long recipientId, String recipientRole, String fcmToken) {
        try {
            NotificationDTO notification = new NotificationDTO();
            notification.setTitle(title);
            notification.setBody(body);
            notification.setType(NotificationDTO.TYPE_PUSH);
            notification.setStatus(NotificationDTO.STATUS_SENT);
            notification.setReadStatus(NotificationDTO.STATUS_UNREAD);
            notification.setSenderId(senderId);
            notification.setSenderName(senderName);
            notification.setRecipientId(recipientId);
            notification.setRecipientRole(recipientRole);
            notification.setFcmToken(fcmToken);
            notification.setSentTime(new java.util.Date());

            notificationService.add(notification, new UserContext());
        } catch (Exception e) {
            System.err.println("Error saving notification record: " + e.getMessage());
        }
    }

    /**
     * Android-specific configuration
     */
    private AndroidConfig getAndroidConfig(String title, String body) {
        return AndroidConfig.builder()
            .setTtl(3600 * 1000) // 1 hour in milliseconds
            .setPriority(AndroidConfig.Priority.HIGH)
            .setNotification(AndroidNotification.builder()
                .setTitle(title)
                .setBody(body)
                .setIcon("ic_notification")
                .setColor("#00d4ff")
                .build())
            .build();
    }

    /**
     * iOS-specific configuration
     */
    private ApnsConfig getApnsConfig(String title, String body) {
        return ApnsConfig.builder()
            .setAps(Aps.builder()
                .setAlert(com.google.firebase.messaging.ApsAlert.builder()
                    .setTitle(title)
                    .setBody(body)
                    .build())
                .setBadge(1)
                .setSound("default")
                .build())
            .build();
    }

    /**
     * Web-specific configuration
     */
    private WebpushConfig getWebpushConfig(String title, String body) {
        return WebpushConfig.builder()
            .setNotification(WebpushNotification.builder()
                .setTitle(title)
                .setBody(body)
                .setIcon("/assets/icons/notification-icon.png")
                .build())
            .build();
    }
}
