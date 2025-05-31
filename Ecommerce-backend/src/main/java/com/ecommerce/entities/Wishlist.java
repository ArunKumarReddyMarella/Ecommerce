package com.ecommerce.entities;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.CreationTimestamp;

import java.sql.Timestamp;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Table(name = "wishlist")
public class Wishlist {

    @Id
    private String wishlistId;

    @Column(nullable = false)
    @NotBlank(message = "User ID cannot be blank")
    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id", nullable = false)
    private String userId;

    @Column(nullable = false)
    @NotBlank(message = "Product ID cannot be blank")
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "product_id", nullable = false)
    private String productId;

    @CreationTimestamp
    @Column(updatable = false)
    private Timestamp createdAt;
}
