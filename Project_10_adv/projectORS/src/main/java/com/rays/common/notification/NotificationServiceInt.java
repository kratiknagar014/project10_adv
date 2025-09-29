package com.rays.common.notification;

import java.util.List;

import com.rays.common.BaseServiceInt;
import com.rays.common.UserContext;

/**
 * Notification Service Interface
 * 
 * @author ORS Team
 */
public interface NotificationServiceInt extends BaseServiceInt<NotificationDTO> {

    /**
     * Find notifications by recipient ID
     */
    public List<NotificationDTO> findByRecipientId(Long recipientId, UserContext userContext);

    /**
     * Find unread notifications by recipient ID
     */
    public List<NotificationDTO> findUnreadByRecipientId(Long recipientId, UserContext userContext);

    /**
     * Count unread notifications by recipient ID
     */
    public long countUnreadByRecipientId(Long recipientId, UserContext userContext);

    /**
     * Mark notification as read
     */
    public void markAsRead(Long notificationId, UserContext userContext);

    /**
     * Mark all notifications as read for a recipient
     */
    public void markAllAsRead(Long recipientId, UserContext userContext);

    /**
     * Find notifications by sender ID
     */
    public List<NotificationDTO> findBySenderId(Long senderId, UserContext userContext);

    /**
     * Find notifications by recipient role
     */
    public List<NotificationDTO> findByRecipientRole(String role, UserContext userContext);

    /**
     * Send notification to specific user
     */
    public void sendNotificationToUser(Long recipientId, String title, String body, UserContext userContext);

    /**
     * Send notification to all users with specific role
     */
    public void sendNotificationToRole(String role, String title, String body, UserContext userContext);

    /**
     * Send notification to all users
     */
    public void sendNotificationToAll(String title, String body, UserContext userContext);

    /**
     * Delete old notifications (older than specified days)
     */
    public void deleteOldNotifications(int days, UserContext userContext);
}
