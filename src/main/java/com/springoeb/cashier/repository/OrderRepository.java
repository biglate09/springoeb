package com.springoeb.cashier.repository;

import com.springoeb.cashier.model.Order;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface OrderRepository extends CrudRepository<Order,Integer>{
    List<Order> findByBill_StatusAndBill_Table_BranchNoOrderByOrderNoDesc(String status,int branchNo);
    Order findByOrderNo(int orderNo);
    void removeByOrderNo(int orderNo);
}
