package com.ecommerce.service;

import com.ecommerce.dto.OrderDataDto;
import com.ecommerce.entities.Order;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;
import java.util.Map;

public interface OrderService {
    Page<Order> getOrders(Pageable pageable);
    Order getOrderById(String id);
    List<OrderDataDto> getOrderDataByUserId(String userId);
    Order createOrder(Order order);
    Order updateOrder(Order updatedOrder);
    Order patchOrder(String orderId, Map<String, Object> updates);
    void deleteOrder(String id);
}
