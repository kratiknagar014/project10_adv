package com.rays.dao;

import java.util.Optional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import com.rays.dto.RefreshTokenDTO;
import com.rays.dto.UserDTO;

/**
 * RefreshToken DAO Interface
 * 
 * @author Rajat Dhakad
 */
@Repository
public interface RefreshTokenDAOInt extends JpaRepository<RefreshTokenDTO, Long> {

    /**
     * Find refresh token by token string
     */
    Optional<RefreshTokenDTO> findByToken(String token);

    /**
     * Find refresh token by user
     */
    Optional<RefreshTokenDTO> findByUser(UserDTO user);

    /**
     * Delete refresh token by user
     */
    @Modifying
    @Query("DELETE FROM RefreshTokenDTO rt WHERE rt.user = :user")
    void deleteByUser(@Param("user") UserDTO user);

    /**
     * Delete all expired tokens
     */
    @Modifying
    @Query("DELETE FROM RefreshTokenDTO rt WHERE rt.expiryDate < CURRENT_TIMESTAMP")
    void deleteAllExpiredTokens();

    /**
     * Revoke all tokens for a user
     */
    @Modifying
    @Query("UPDATE RefreshTokenDTO rt SET rt.revoked = true WHERE rt.user = :user")
    void revokeAllUserTokens(@Param("user") UserDTO user);

    /**
     * Find active (non-revoked, non-expired) token by user
     */
    @Query("SELECT rt FROM RefreshTokenDTO rt WHERE rt.user = :user AND rt.revoked = false AND rt.expiryDate > CURRENT_TIMESTAMP")
    Optional<RefreshTokenDTO> findActiveTokenByUser(@Param("user") UserDTO user);
}
