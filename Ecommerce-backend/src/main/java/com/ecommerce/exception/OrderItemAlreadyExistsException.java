package com.ecommerce.exception;

public class OrderItemAlreadyExistsException extends RuntimeException {
    public OrderItemAlreadyExistsException(String message) {
        super(message);
    }
}
