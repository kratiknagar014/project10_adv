package com.rays.service;

import java.util.Optional;
import com.rays.dto.RefreshTokenDTO;
import com.rays.dto.UserDTO;

/**
 * RefreshToken Service Interface
 * 
 * @author Rajat Dhakad
 */
public interface RefreshTokenServiceInt {

    /**
     * Create refresh token for user
     */
    RefreshTokenDTO createRefreshToken(Long userId);

    /**
     * Find refresh token by token string
     */
    Optional<RefreshTokenDTO> findByToken(String token);

    /**
     * Verify expiration of refresh token
     */
    RefreshTokenDTO verifyExpiration(RefreshTokenDTO token);

    /**
     * Delete refresh token by user
     */
    void deleteByUser(UserDTO user);

    /**
     * Revoke refresh token
     */
    void revokeToken(String token);

    /**
     * Revoke all tokens for user
     */
    void revokeAllUserTokens(Long userId);

    /**
     * Clean up expired tokens
     */
    void deleteExpiredTokens();

    /**
     * Rotate refresh token (create new, revoke old)
     */
    RefreshTokenDTO rotateRefreshToken(String oldToken);
}
