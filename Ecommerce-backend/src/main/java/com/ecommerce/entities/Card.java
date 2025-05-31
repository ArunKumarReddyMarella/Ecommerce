package com.ecommerce.entities;

import jakarta.persistence.*;
import lombok.*;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import java.sql.Date;
import java.sql.Timestamp;

@Entity
@Table(name = "card")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Card {
    @Id
    @Column(name = "card_id", length = 50)
    private String cardId;

    @Column(name = "card_number", length = 50, nullable = false)
    private String cardNumber;

    @Column(name = "card_holder_name", length = 255, nullable = false)
    private String cardHolderName;

    @Column(name = "card_type", length = 50, nullable = false)
    private String cardType;

    @Column(name = "expiration_date", nullable = false)
    private Date expirationDate;

    @Column(name = "cvv", nullable = false)
    private Integer cvv;

    @Column(name = "user_id", length = 50, nullable = false)
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id", nullable = false)
    private User user;


    @Column(name = "created_at", nullable = false, updatable = false)
    @CreationTimestamp
    private Timestamp createdAt;

    @UpdateTimestamp
    private Timestamp lastUpdate;
}

