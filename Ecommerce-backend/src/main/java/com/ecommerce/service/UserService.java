package com.ecommerce.service;

import com.ecommerce.entities.User;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.Map;

public interface UserService {
    Page<User> getUsers(Pageable pageable);

    User getUserById(String userId);

    User getUserByUsername(String username);

    User createUser(User user);

    void deleteUser(String userId);

    User updateUser(User updatedUser);

    void patchUser(String userId, Map<String, Object> updates);
}
