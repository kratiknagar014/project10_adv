package com.rays.common.notification;

import java.util.List;

import com.rays.common.BaseDAOInt;
import com.rays.common.UserContext;

/**
 * Notification DAO Interface
 * 
 * @author ORS Team
 */
public interface NotificationDAOInt extends BaseDAOInt<NotificationDTO> {

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
     * Delete old notifications (older than specified days)
     */
    public void deleteOldNotifications(int days, UserContext userContext);
}
