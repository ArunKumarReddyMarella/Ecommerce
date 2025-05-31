package com.ecommerce.exception;

public class OrderAlreadyExistException extends RuntimeException{

    public OrderAlreadyExistException(String message) {
        super(message);
    }
}
