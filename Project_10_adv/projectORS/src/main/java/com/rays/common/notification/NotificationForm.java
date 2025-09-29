package com.rays.common.notification;

import java.util.Date;

import javax.validation.constraints.NotEmpty;

import com.rays.common.BaseDTO;
import com.rays.common.BaseForm;

/**
 * Notification Form for handling notification requests
 * 
 * @author ORS Team
 */
public class NotificationForm extends BaseForm {

    @NotEmpty(message = "Title is required")
    private String title;

    @NotEmpty(message = "Body is required")
    private String body;

    private String type = NotificationDTO.TYPE_PUSH;

    private String status = NotificationDTO.STATUS_PENDING;

    private String readStatus = NotificationDTO.STATUS_UNREAD;

    private Long senderId;

    private String senderName;

    private Long recipientId;

    private String recipientRole;

    private String fcmToken;

    private Date sentTime;

    private Date readTime;

    private String dataPayload;

    private String imageUrl;

    private String clickAction;

    private String priority = "normal";

    // For bulk notifications
    private String targetRole; // "ALL", "Student", "Faculty", etc.
    private boolean sendToAll = false;

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getBody() {
        return body;
    }

    public void setBody(String body) {
        this.body = body;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getReadStatus() {
        return readStatus;
    }

    public void setReadStatus(String readStatus) {
        this.readStatus = readStatus;
    }

    public Long getSenderId() {
        return senderId;
    }

    public void setSenderId(Long senderId) {
        this.senderId = senderId;
    }

    public String getSenderName() {
        return senderName;
    }

    public void setSenderName(String senderName) {
        this.senderName = senderName;
    }

    public Long getRecipientId() {
        return recipientId;
    }

    public void setRecipientId(Long recipientId) {
        this.recipientId = recipientId;
    }

    public String getRecipientRole() {
        return recipientRole;
    }

    public void setRecipientRole(String recipientRole) {
        this.recipientRole = recipientRole;
    }

    public String getFcmToken() {
        return fcmToken;
    }

    public void setFcmToken(String fcmToken) {
        this.fcmToken = fcmToken;
    }

    public Date getSentTime() {
        return sentTime;
    }

    public void setSentTime(Date sentTime) {
        this.sentTime = sentTime;
    }

    public Date getReadTime() {
        return readTime;
    }

    public void setReadTime(Date readTime) {
        this.readTime = readTime;
    }

    public String getDataPayload() {
        return dataPayload;
    }

    public void setDataPayload(String dataPayload) {
        this.dataPayload = dataPayload;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public String getClickAction() {
        return clickAction;
    }

    public void setClickAction(String clickAction) {
        this.clickAction = clickAction;
    }

    public String getPriority() {
        return priority;
    }

    public void setPriority(String priority) {
        this.priority = priority;
    }

    public String getTargetRole() {
        return targetRole;
    }

    public void setTargetRole(String targetRole) {
        this.targetRole = targetRole;
    }

    public boolean isSendToAll() {
        return sendToAll;
    }

    public void setSendToAll(boolean sendToAll) {
        this.sendToAll = sendToAll;
    }

    @Override
    public BaseDTO getDto() {
        NotificationDTO dto = initDTO(new NotificationDTO());
        
        dto.setTitle(title);
        dto.setBody(body);
        dto.setType(type);
        dto.setStatus(status);
        dto.setReadStatus(readStatus);
        dto.setSenderId(senderId);
        dto.setSenderName(senderName);
        dto.setRecipientId(recipientId);
        dto.setRecipientRole(recipientRole);
        dto.setFcmToken(fcmToken);
        dto.setSentTime(sentTime);
        dto.setReadTime(readTime);
        dto.setDataPayload(dataPayload);
        dto.setImageUrl(imageUrl);
        dto.setClickAction(clickAction);
        dto.setPriority(priority);
        
        return dto;
    }
}
