package com.ecommerce.repository;

import com.ecommerce.entities.Card;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface CardRepository extends JpaRepository<Card, String> {
    Optional<Card> findByCardNumber(String cardNumber);

    List<Card> findByUserId(String userId);
}
