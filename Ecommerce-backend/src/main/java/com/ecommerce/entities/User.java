package com.ecommerce.entities;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import java.sql.Timestamp;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Table(name = "user")
public class User {

    @Id
    private String userId;
    private String firstName;
    private String middleName;
    private String lastName;
    private String username;
    private String email;
    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "address_id")
    private Address address;
    @Column(updatable = false) // Prevent accidental updates
    @CreationTimestamp
    private Timestamp createdAt;
    @UpdateTimestamp
    private Timestamp lastUpdate;
}
