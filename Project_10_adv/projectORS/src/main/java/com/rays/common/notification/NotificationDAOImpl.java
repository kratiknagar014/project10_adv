package com.rays.common.notification;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.springframework.stereotype.Repository;

import com.rays.common.BaseDAOImpl;
import com.rays.common.UserContext;

/**
 * Notification DAO Implementation
 * 
 * @author ORS Team
 */
@Repository
public class NotificationDAOImpl extends BaseDAOImpl<NotificationDTO> implements NotificationDAOInt {

    @Override
    public Class<NotificationDTO> getDTOClass() {
        return NotificationDTO.class;
    }

    @Override
    public List<NotificationDTO> findByRecipientId(Long recipientId, UserContext userContext) {
        NotificationDTO dto = new NotificationDTO();
        dto.setRecipientId(recipientId);
        return search(dto, userContext);
    }

    @Override
    public List<NotificationDTO> findUnreadByRecipientId(Long recipientId, UserContext userContext) {
        NotificationDTO dto = new NotificationDTO();
        dto.setRecipientId(recipientId);
        dto.setReadStatus(NotificationDTO.STATUS_UNREAD);
        return search(dto, userContext);
    }

    @Override
    public long countUnreadByRecipientId(Long recipientId, UserContext userContext) {
        NotificationDTO dto = new NotificationDTO();
        dto.setRecipientId(recipientId);
        dto.setReadStatus(NotificationDTO.STATUS_UNREAD);
        List<NotificationDTO> list = search(dto, userContext);
        return list.size();
    }

    @Override
    public void markAsRead(Long notificationId, UserContext userContext) {
        NotificationDTO notification = findByPK(notificationId, userContext);
        if (notification != null) {
            notification.setReadStatus(NotificationDTO.STATUS_READ);
            notification.setReadTime(new Date());
            update(notification, userContext);
        }
    }

    @Override
    public void markAllAsRead(Long recipientId, UserContext userContext) {
        List<NotificationDTO> unreadNotifications = findUnreadByRecipientId(recipientId, userContext);
        Date readTime = new Date();
        
        for (NotificationDTO notification : unreadNotifications) {
            notification.setReadStatus(NotificationDTO.STATUS_READ);
            notification.setReadTime(readTime);
            update(notification, userContext);
        }
    }

    @Override
    public List<NotificationDTO> findBySenderId(Long senderId, UserContext userContext) {
        NotificationDTO dto = new NotificationDTO();
        dto.setSenderId(senderId);
        return search(dto, userContext);
    }

    @Override
    public List<NotificationDTO> findByRecipientRole(String role, UserContext userContext) {
        NotificationDTO dto = new NotificationDTO();
        dto.setRecipientRole(role);
        return search(dto, userContext);
    }

    @Override
    public void deleteOldNotifications(int days, UserContext userContext) {
        Calendar calendar = Calendar.getInstance();
        calendar.add(Calendar.DAY_OF_MONTH, -days);
        Date cutoffDate = calendar.getTime();

        // For now, we'll skip this complex query and implement it later if needed
        // This would require a custom query implementation
        System.out.println("Delete old notifications before: " + cutoffDate);
    }

    @Override
    protected void populate(NotificationDTO dto, UserContext userContext) {
        // Add any additional population logic if needed
        super.populate(dto, userContext);
    }

    @Override
    protected List<Predicate> getWhereClause(NotificationDTO dto, CriteriaBuilder builder, Root<NotificationDTO> qRoot) {
        List<Predicate> whereCondition = new ArrayList<>(); // super.getWhereClause(dto, builder, qRoot);

        if (dto.getTitle() != null && !dto.getTitle().isEmpty()) {
            whereCondition.add(builder.like(qRoot.get("title"), "%" + dto.getTitle() + "%"));
        }

        if (dto.getType() != null && !dto.getType().isEmpty()) {
            whereCondition.add(builder.equal(qRoot.get("type"), dto.getType()));
        }

        if (dto.getStatus() != null && !dto.getStatus().isEmpty()) {
            whereCondition.add(builder.equal(qRoot.get("status"), dto.getStatus()));
        }

        if (dto.getReadStatus() != null && !dto.getReadStatus().isEmpty()) {
            whereCondition.add(builder.equal(qRoot.get("readStatus"), dto.getReadStatus()));
        }

        if (dto.getSenderId() != null && dto.getSenderId() > 0) {
            whereCondition.add(builder.equal(qRoot.get("senderId"), dto.getSenderId()));
        }

        if (dto.getRecipientId() != null && dto.getRecipientId() > 0) {
            whereCondition.add(builder.equal(qRoot.get("recipientId"), dto.getRecipientId()));
        }

        if (dto.getRecipientRole() != null && !dto.getRecipientRole().isEmpty()) {
            whereCondition.add(builder.equal(qRoot.get("recipientRole"), dto.getRecipientRole()));
        }

        if (dto.getSentTime() != null) {
            whereCondition.add(builder.greaterThanOrEqualTo(qRoot.get("sentTime"), dto.getSentTime()));
        }

        return whereCondition;
    }
}
