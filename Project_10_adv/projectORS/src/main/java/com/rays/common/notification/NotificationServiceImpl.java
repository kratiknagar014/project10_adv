package com.rays.common.notification;

import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.rays.common.BaseServiceImpl;
import com.rays.common.UserContext;
import com.rays.dao.UserDAOInt;
import com.rays.dto.UserDTO;

/**
 * Notification Service Implementation
 * Handles notification business logic and FCM operations
 * 
 * @author ORS Team
 */
@Service
@Transactional
public class NotificationServiceImpl extends BaseServiceImpl<NotificationDTO, NotificationDAOInt> implements NotificationServiceInt {

    private static Logger log = LoggerFactory.getLogger(NotificationServiceImpl.class);

    @Autowired
    private NotificationDAOInt notificationDAO;

    @Autowired
    private UserDAOInt userDAO;

    @Autowired
    private FCMService fcmService;

    @Override
    @Transactional(readOnly = true)
    public List<NotificationDTO> findByRecipientId(Long recipientId, UserContext userContext) {
        return notificationDAO.findByRecipientId(recipientId, userContext);
    }

    @Override
    @Transactional(readOnly = true)
    public List<NotificationDTO> findUnreadByRecipientId(Long recipientId, UserContext userContext) {
        return notificationDAO.findUnreadByRecipientId(recipientId, userContext);
    }

    @Override
    @Transactional(readOnly = true)
    public long countUnreadByRecipientId(Long recipientId, UserContext userContext) {
        return notificationDAO.countUnreadByRecipientId(recipientId, userContext);
    }

    @Override
    public void markAsRead(Long notificationId, UserContext userContext) {
        notificationDAO.markAsRead(notificationId, userContext);
    }

    @Override
    public void markAllAsRead(Long recipientId, UserContext userContext) {
        notificationDAO.markAllAsRead(recipientId, userContext);
    }

    @Override
    @Transactional(readOnly = true)
    public List<NotificationDTO> findBySenderId(Long senderId, UserContext userContext) {
        return notificationDAO.findBySenderId(senderId, userContext);
    }

    @Override
    @Transactional(readOnly = true)
    public List<NotificationDTO> findByRecipientRole(String role, UserContext userContext) {
        return notificationDAO.findByRecipientRole(role, userContext);
    }

    @Override
    public void sendNotificationToUser(Long recipientId, String title, String body, UserContext userContext) {
        try {
            // Get recipient user details
            UserDTO recipient = userDAO.findByPK(recipientId, userContext);
            if (recipient == null) {
                log.error("Recipient user not found with ID: " + recipientId);
                return;
            }

            // Create notification record
            NotificationDTO notification = new NotificationDTO();
            notification.setTitle(title);
            notification.setBody(body);
            notification.setType(NotificationDTO.TYPE_PUSH);
            notification.setStatus(NotificationDTO.STATUS_PENDING);
            notification.setReadStatus(NotificationDTO.STATUS_UNREAD);
            notification.setSenderId(userContext.getUserId());
            notification.setSenderName(userContext.getName());
            notification.setRecipientId(recipientId);
            notification.setRecipientRole(recipient.getRoleName());
            notification.setFcmToken(recipient.getFcmToken());
            notification.setPriority("normal");

            // Save notification to database
            Long notificationId = add(notification, userContext);

            // Send FCM notification if token exists
            if (recipient.getFcmToken() != null && !recipient.getFcmToken().isEmpty()) {
                String response = fcmService.sendNotificationToUser(recipient.getFcmToken(), title, body, null);
                
                // Update notification status
                notification.setId(notificationId);
                notification.setStatus(response != null ? NotificationDTO.STATUS_SENT : NotificationDTO.STATUS_FAILED);
                notification.setSentTime(new Date());
                update(notification, userContext);
            }

            log.info("Notification sent to user: " + recipientId + ", Title: " + title);

        } catch (Exception e) {
            log.error("Error sending notification to user: " + recipientId, e);
        }
    }

    @Override
    public void sendNotificationToRole(String role, String title, String body, UserContext userContext) {
        try {
            // Get all users with the specified role
            UserDTO searchCriteria = new UserDTO();
            searchCriteria.setRoleName(role);
            @SuppressWarnings("unchecked")
            List<UserDTO> users = (List<UserDTO>) userDAO.search(searchCriteria, 0, 0, userContext);

            for (UserDTO user : users) {
                sendNotificationToUser(user.getId(), title, body, userContext);
            }

            log.info("Notification sent to role: " + role + ", Count: " + users.size() + ", Title: " + title);

        } catch (Exception e) {
            log.error("Error sending notification to role: " + role, e);
        }
    }

    @Override
    public void sendNotificationToAll(String title, String body, UserContext userContext) {
        try {
            // Get all active users
            UserDTO searchCriteria = new UserDTO();
            searchCriteria.setStatus("Active");
            @SuppressWarnings("unchecked")
            List<UserDTO> users = (List<UserDTO>) userDAO.search(searchCriteria, 0, 0, userContext);

            for (UserDTO user : users) {
                sendNotificationToUser(user.getId(), title, body, userContext);
            }

            log.info("Notification sent to all users, Count: " + users.size() + ", Title: " + title);

        } catch (Exception e) {
            log.error("Error sending notification to all users", e);
        }
    }

    @Override
    public void deleteOldNotifications(int days, UserContext userContext) {
        notificationDAO.deleteOldNotifications(days, userContext);
        log.info("Deleted notifications older than " + days + " days");
    }
}
