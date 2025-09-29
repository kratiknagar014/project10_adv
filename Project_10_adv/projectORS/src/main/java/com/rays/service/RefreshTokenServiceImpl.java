package com.rays.service;

import java.time.Instant;
import java.util.Optional;
import java.util.UUID;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

// import com.rays.common.exception.DuplicateRecordException;
import com.rays.dao.RefreshTokenDAOInt;
import com.rays.dto.RefreshTokenDTO;
import com.rays.dto.UserDTO;

/**
 * RefreshToken Service Implementation
 * 
 * @author Rajat Dhakad
 */
@Service
@Transactional
public class RefreshTokenServiceImpl implements RefreshTokenServiceInt {

    private static final Logger log = LoggerFactory.getLogger(RefreshTokenServiceImpl.class);

    @Autowired
    private RefreshTokenDAOInt refreshTokenDAO;

    @Autowired
    private UserServiceInt userService;

    @Value("${jwt.refresh.expiration:604800}") // 7 days default
    private Long refreshTokenDurationMs;

    @Override
    public RefreshTokenDTO createRefreshToken(Long userId) {
        try {
            // Find user by ID
            UserDTO user = userService.findById(userId, null);
            if (user == null) {
                throw new RuntimeException("User not found with id: " + userId);
            }

            // Revoke existing active tokens for user
            revokeAllUserTokens(userId);

            RefreshTokenDTO refreshToken = new RefreshTokenDTO();
            refreshToken.setUser(user);
            refreshToken.setExpiryDate(Instant.now().plusSeconds(refreshTokenDurationMs));
            refreshToken.setToken(UUID.randomUUID().toString());
            refreshToken.setRevoked(false);

            refreshToken = refreshTokenDAO.save(refreshToken);
            log.info("Created refresh token for user: {}", user.getLoginId());
            
            return refreshToken;
        } catch (Exception e) {
            log.error("Error creating refresh token for user: {}", userId, e);
            throw new RuntimeException("Could not create refresh token", e);
        }
    }

    @Override
    public Optional<RefreshTokenDTO> findByToken(String token) {
        return refreshTokenDAO.findByToken(token);
    }

    @Override
    public RefreshTokenDTO verifyExpiration(RefreshTokenDTO token) {
        if (token.isExpired() || token.isRevoked()) {
            refreshTokenDAO.delete(token);
            throw new RuntimeException("Refresh token was expired or revoked. Please make a new signin request");
        }
        return token;
    }

    @Override
    public void deleteByUser(UserDTO user) {
        refreshTokenDAO.deleteByUser(user);
        log.info("Deleted refresh tokens for user: {}", user.getLoginId());
    }

    @Override
    public void revokeToken(String token) {
        Optional<RefreshTokenDTO> refreshToken = refreshTokenDAO.findByToken(token);
        if (refreshToken.isPresent()) {
            RefreshTokenDTO tokenEntity = refreshToken.get();
            tokenEntity.setRevoked(true);
            refreshTokenDAO.save(tokenEntity);
            log.info("Revoked refresh token for user: {}", tokenEntity.getUser().getLoginId());
        }
    }

    @Override
    public void revokeAllUserTokens(Long userId) {
        try {
            UserDTO user = userService.findById(userId, null);
            if (user != null) {
                refreshTokenDAO.revokeAllUserTokens(user);
                log.info("Revoked all refresh tokens for user: {}", user.getLoginId());
            }
        } catch (Exception e) {
            log.error("Error revoking tokens for user: {}", userId, e);
        }
    }

    @Override
    public void deleteExpiredTokens() {
        refreshTokenDAO.deleteAllExpiredTokens();
        log.info("Deleted all expired refresh tokens");
    }

    @Override
    public RefreshTokenDTO rotateRefreshToken(String oldToken) {
        Optional<RefreshTokenDTO> refreshTokenOpt = findByToken(oldToken);
        
        if (!refreshTokenOpt.isPresent()) {
            throw new RuntimeException("Refresh token not found");
        }

        RefreshTokenDTO oldRefreshToken = refreshTokenOpt.get();
        verifyExpiration(oldRefreshToken);

        // Revoke old token
        revokeToken(oldToken);

        // Create new token
        return createRefreshToken(oldRefreshToken.getUser().getId());
    }
}
