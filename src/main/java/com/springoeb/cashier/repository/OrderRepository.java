package com.springoeb.cashier.repository;

import com.springoeb.cashier.model.Order;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.sql.Date;
import java.util.List;

@Repository
public interface OrderRepository extends CrudRepository<Order,Integer>{
    List<Order> findByBill_StatusAndStatusInAndBill_Table_BranchNoOrderByStatusDescOrderNoAsc(String status,List<String> orderStatus,int branchNo);
    Order findByOrderNo(int orderNo);
    void removeByOrderNo(int orderNo);
    @Query("select sum(o.quantity) from CustomerOrder o where o.menuNo = ?1 and status = ?2")
    Long sumByMenuNo(int menuNo,String servedStatus);
    @Query("select sum(o.quantity) from CustomerOrder o where o.menuNo = ?1 and o.date between ?2 and ?3 and status = ?4")
    Long sumByMenuNoAndDateIsBetween(int menuNo, Date fromDate, Date toDate, String servedStatus);
    @Query("select max(o.date) from CustomerOrder o join o.bill b join b.table t join o.menu m where t.branchNo = ?1 and m.menuFlag = ?2")
    Date findMaxOrderDateByBranchNo(int branchNo, String menuFlag);
    @Query("select min(o.date) from CustomerOrder o join o.bill b join b.table t join o.menu m where t.branchNo = ?1 and m.menuFlag = ?2")
    Date findMinOrderDateByBranchNo(int branchNo, String menuFlag);
}