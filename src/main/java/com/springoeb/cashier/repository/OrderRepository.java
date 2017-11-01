package com.springoeb.cashier.repository;

import com.springoeb.cashier.model.Order;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;

@Repository
public interface OrderRepository extends CrudRepository<Order,Integer>{
    List<Order> findByBill_StatusAndBill_Table_BranchNoOrderByStatusDescOrderNoAsc(String status,int branchNo);
    Order findByOrderNo(int orderNo);
    void removeByOrderNo(int orderNo);
    @Query("select sum(o.quantity) from CustomerOrder o where o.menuNo = ?1 and status = ?2")
    Long sumByMenuNo(int menuNo,String servedStatus);
    @Query("select sum(o.quantity) from CustomerOrder o where o.menuNo = ?1 and o.date between ?2 and ?3 and status = ?4")
    Long sumByMenuNoAndDateIsBetween(int menuNo, Date fromDate, Date toDate, String servedStatus);
}