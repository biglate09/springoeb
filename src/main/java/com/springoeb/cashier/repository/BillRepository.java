package com.springoeb.cashier.repository;

import com.springoeb.cashier.model.Bill;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.sql.Date;
import java.util.List;

@Repository
public interface BillRepository extends CrudRepository<Bill,Integer>{
    List<Bill> findByTable_BranchNoAndStatus(int branchNo,String status);
    Bill findByBillNo(int billNo);
    @Query("select sum(b.totalAmount) from Bill b join b.table t where b.billDate = ?1 and t.branchNo = ?2")
    Double sumTotalAmountByDateAndBranchNo(Date date, int branchNo);
    @Query("select min(b.billDate) from Bill b join b.table t where t.branchNo = ?1 and b.status = ?2 order by t.tableName asc")
    Date findMinDateByBranchNo(int branchNo,String status);
    @Query("select max(b.billDate) from Bill b join b.table t where t.branchNo = ?1 and b.status = ?2")
    Date findMaxDateByBranchNo(int branchNo,String status);
    @Query("select sum(b.totalAmount) from Bill b join b.table t where t.branchNo = ?1 and b.status = ?2 and billDate between ?3 and ?4")
    Double sumBillByBranchNoAndStatusAndDateIsBetween(int branchNo,String status,Date fromDate,Date toDate);
}