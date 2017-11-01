package com.springoeb.cashier.service;

import com.springoeb.cashier.model.Bill;
import com.springoeb.cashier.model.Order;
import com.springoeb.cashier.repository.OrderRepository;
import com.springoeb.menu.model.Menu;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Date;
import java.util.List;

@Service
public class OrderService {
    @Autowired
    private OrderRepository orderRepository;

    public List<Order> getOrders(int branchNo) {
        return orderRepository.findByBill_StatusAndBill_Table_BranchNoOrderByStatusDescOrderNoAsc(Bill.UNPAID, branchNo);
    }

    public Order findByOrderNo(int orderNo) {
        return orderRepository.findByOrderNo(orderNo);
    }

    public void removeByOrderNo(int orderNo) {
        orderRepository.removeByOrderNo(orderNo);
    }

    public void save(Order order) {
        orderRepository.save(order);
    }

    public Date findMinMenuOrderDateByBranchNo(int branchNo){
        return orderRepository.findMinOrderDateByBranchNo(branchNo, Menu.flagForMenu);
    }

    public Date findMaxMenuOrderDateByBranchNo(int branchNo){
        return orderRepository.findMaxOrderDateByBranchNo(branchNo, Menu.flagForMenu);
    }

    public Date findMinMenuSetOrderDateByBranchNo(int branchNo){
        return orderRepository.findMinOrderDateByBranchNo(branchNo, Menu.flagForMenuSet);
    }

    public Date findMaxMenuSetOrderDateByBranchNo(int branchNo){
        return orderRepository.findMaxOrderDateByBranchNo(branchNo, Menu.flagForMenuSet);
    }
}
