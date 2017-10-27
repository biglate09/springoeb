package com.springoeb.cashier.repository;

import com.springoeb.cashier.model.Bill;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BillRepository extends CrudRepository<Bill,Integer>{
    List<Bill> findByTable_BranchNo(int branchNo);
}