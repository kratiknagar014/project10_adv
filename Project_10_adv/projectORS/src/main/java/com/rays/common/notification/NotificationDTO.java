package com.rays.common.notification;

import java.util.Date;
import java.util.LinkedHashMap;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.rays.common.BaseDTO;

/**
 * Notification DTO for Firebase Cloud Messaging
 * Stores notification data for push notifications
 * 
 * @author ORS Team
 */
@Entity
@Table(name = "ST_NOTIFICATION")
public class NotificationDTO extends BaseDTO {

    public static final String TYPE_PUSH = "PUSH";
    public static final String TYPE_EMAIL = "EMAIL";
    public static final String TYPE_SMS = "SMS";
    
    public static final String STATUS_SENT = "SENT";
    public static final String STATUS_PENDING = "PENDING";
    public static final String STATUS_FAILED = "FAILED";
    public static final String STATUS_READ = "READ";
    public static final String STATUS_UNREAD = "unread";

    @Column(name = "TITLE", length = 200, nullable = false)
    private String title;

    @Column(name = "BODY", length = 1000, nullable = false)
    private String body;

    @Column(name = "TYPE", length = 20)
    private String type = TYPE_PUSH;

    @Column(name = "STATUS", length = 20)
    private String status = STATUS_PENDING;

    @Column(name = "READ_status", length = 20)
    private String readStatus = STATUS_UNREAD;

    @Column(name = "SENDER_ID")
    private Long senderId;

    @Column(name = "SENDER_NAME", length = 100)
    private String senderName;

    @Column(name = "RECIPIENT_ID")
    private Long recipientId;

    @Column(name = "RECIPIENT_ROLE", length = 50)
    private String recipientRole;

    @Column(name = "FCM_TOKEN", length = 500)
    private String fcmToken;

    @Column(name = "SENT_TIME")
    @Temporal(TemporalType.TIMESTAMP)
    private Date sentTime;

    @Column(name = "READ_TIME")
    @Temporal(TemporalType.TIMESTAMP)
    private Date readTime;

    @Column(name = "DATA_PAYLOAD", length = 1000)
    private String dataPayload;

    @Column(name = "IMAGE_URL", length = 500)
    private String imageUrl;

    @Column(name = "CLICK_ACTION", length = 200)
    private String clickAction;

    @Column(name = "PRIORITY", length = 20)
    private String priority = "normal";

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

    @Override
    public LinkedHashMap<String, String> orderBY() {
        LinkedHashMap<String, String> map = new LinkedHashMap<String, String>();
        map.put("createdDatetime", "desc");
        return map;
    }

    @Override
    public LinkedHashMap<String, Object> uniqueKeys() {
        LinkedHashMap<String, Object> map = new LinkedHashMap<String, Object>();
        map.put("id", id);
        return map;
    }

    @Override
    public String getValue() {
        return title;
    }

    @Override
    public String getUniqueKey() {
        return "id";
    }

    @Override
    public String getUniqueValue() {
        return String.valueOf(id);
    }

    @Override
    public String getLabel() {
        return title;
    }
}
