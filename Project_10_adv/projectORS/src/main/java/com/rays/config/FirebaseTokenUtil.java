package com.rays.config;

import org.springframework.stereotype.Component;

/**
 * Stub utility for verifying Firebase ID tokens.
 * NOTE: Replace with proper Firebase Admin SDK verification in production.
 */
@Component
public class FirebaseTokenUtil {

    public boolean verifyToken(String token) {
        return token != null && token.trim().length() > 0;
    }
}
