package com.springoeb.cashier.service;

import com.springoeb.cashier.model.Bill;
import com.springoeb.cashier.repository.BillRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BillService {
    @Autowired
    private BillRepository billRepository;

    public List<Bill> findByTable_BranchNo(int branchNo){
        return findByTable_BranchNo(branchNo);
    }
}
