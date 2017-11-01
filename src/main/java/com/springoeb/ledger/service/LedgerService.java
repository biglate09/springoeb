package com.springoeb.ledger.service;

import com.springoeb.ledger.model.Ledger;
import com.springoeb.ledger.repository.LedgerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LedgerService {
    @Autowired
    private LedgerRepository ledgerRepository;

    public List<Ledger> findByBranchNo(int branchNo){
        return ledgerRepository.findByBranchNo(branchNo);
    }

    public void removeByLedgerNoAndBranchNo(int ledgerNo,int branchNo){
        ledgerRepository.removeByLedgerNoAndBranchNo(ledgerNo,branchNo);
    }

    public void save(Ledger ledger){
        ledgerRepository.save(ledger);
    }

    public Ledger findByLedgerNo(int ledgerNo){
        return ledgerRepository.findByLedgerNo(ledgerNo);
    }

//    public Map<Integer,IncomeExpenseBean> findTotalIncomeExpense(int branchNo, int month, int year){
//        Map<Integer,IncomeExpenseBean> incomeExpenseBeanMap = new LinkedHashMap<Integer,IncomeExpenseBean>();
//        Date fromDate,toDate;
//        if(month == 0){
//            fromDate = Date.valueOf(year+"-01-01");
//            toDate = Date.valueOf(year+"-12-31");
//        }else{
//            fromDate = Date.valueOf(year+"-"+month+"-01");
//            toDate = Date.valueOf(year+"-"+month+"-31");
//        }
//        LinkedList<Ledger> ledgers = ledgerRepository.findByBranchNoAndDateIsBetween(branchNo,fromDate,toDate);
//        for(Ledger l : ledgers) {
//            IncomeExpenseBean incomeExpenseBean = new IncomeExpenseBean();
//            double income = 0, expense = 0;
//            incomeExpenseBean.setIncome(income);
//            incomeExpenseBean.setExpense(expense);
//            incomeExpenseBeanMap.put(iterator, incomeExpenseBean);
//        }
//        return incomeExpenseBeanMap;
//    }
}