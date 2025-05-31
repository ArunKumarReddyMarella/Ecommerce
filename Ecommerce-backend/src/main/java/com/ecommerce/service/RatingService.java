package com.ecommerce.service;

import com.ecommerce.entities.Rating;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.Map;

public interface RatingService {
    Page<Rating> getRatings(Pageable pageable);
    Rating getRatingById(String ratingId);
    Rating createRating(Rating rating);
    Rating updateRating(Rating rating);
    void patchRating(String ratingId, Map<String, Object> updates);
    void deleteRating(String ratingId);

    Page<Rating> getRatingsByProductId(String productId, Pageable pageable);
}
