package com.springoeb.cashier.service;

import com.springoeb.cashier.model.Bill;
import com.springoeb.cashier.model.Order;
import com.springoeb.cashier.repository.OrderRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderService {
    @Autowired
    private OrderRepository orderRepository;

    public List<Order> getOrders(int branchNo){
        return orderRepository.findByBill_StatusAndBill_Table_BranchNoOrderByOrderNoDescMenuNoDescStatusDesc(Bill.UNPAID,branchNo);
    }

    public Order findByOrderNo(int orderNo){
        return orderRepository.findByOrderNo(orderNo);
    }

    public void removeByOrderNo(int orderNo){
        orderRepository.removeByOrderNo(orderNo);
    }

    public void save(Order order){
        orderRepository.save(order);
    }
}
