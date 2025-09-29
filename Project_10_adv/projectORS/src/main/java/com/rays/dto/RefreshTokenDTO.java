package com.rays.dto;

import java.time.Instant;
import javax.persistence.*;
import com.rays.common.BaseDTO;

/**
 * RefreshToken Entity for JWT Token Management
 * 
 * @author Rajat Dhakad
 */
@Entity
@Table(name = "REFRESH_TOKENS")
public class RefreshTokenDTO extends BaseDTO {

    @Column(nullable = false, unique = true)
    private String token;

    @Column(nullable = false)
    private Instant expiryDate;

    @OneToOne
    @JoinColumn(name = "user_id", referencedColumnName = "id")
    private UserDTO user;

    @Column(nullable = false)
    private boolean revoked = false;

    // Default constructor
    public RefreshTokenDTO() {
    }

    // Constructor with token and user
    public RefreshTokenDTO(String token, UserDTO user, Instant expiryDate) {
        this.token = token;
        this.user = user;
        this.expiryDate = expiryDate;
    }

    // Getters and Setters
    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }

    public Instant getExpiryDate() {
        return expiryDate;
    }

    public void setExpiryDate(Instant expiryDate) {
        this.expiryDate = expiryDate;
    }

    public UserDTO getUser() {
        return user;
    }

    public void setUser(UserDTO user) {
        this.user = user;
    }

    public boolean isRevoked() {
        return revoked;
    }

    public void setRevoked(boolean revoked) {
        this.revoked = revoked;
    }

    // Helper method to check if token is expired
    public boolean isExpired() {
        return Instant.now().isAfter(this.expiryDate);
    }

    @Override
    public String getValue() {
        return token;
    }

    @Override
    public String getUniqueKey() {
        return "token";
    }

    @Override
    public String getUniqueValue() {
        return token;
    }

    @Override
    public String getLabel() {
        return token;
    }

    @Override
    public java.util.LinkedHashMap<String, String> orderBY() {
        java.util.LinkedHashMap<String, String> map = new java.util.LinkedHashMap<>();
        map.put("expiryDate", "desc");
        return map;
    }

    @Override
    public java.util.LinkedHashMap<String, Object> uniqueKeys() {
        java.util.LinkedHashMap<String, Object> map = new java.util.LinkedHashMap<>();
        map.put("token", token);
        return map;
    }
}
