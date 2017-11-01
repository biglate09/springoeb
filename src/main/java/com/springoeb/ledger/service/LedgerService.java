package com.springoeb.ledger.service;

import com.springoeb.ledger.model.Ledger;
import com.springoeb.ledger.model.LedgerPay;
import com.springoeb.ledger.repository.LedgerRepository;
import com.springoeb.report.model.IncomeExpenseBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

@Service
public class LedgerService {
    @Autowired
    private LedgerRepository ledgerRepository;

    public List<Ledger> findByBranchNo(int branchNo) {
        return ledgerRepository.findByBranchNo(branchNo);
    }

    public void removeByLedgerNoAndBranchNo(int ledgerNo, int branchNo) {
        ledgerRepository.removeByLedgerNoAndBranchNo(ledgerNo, branchNo);
    }

    public void save(Ledger ledger) {
        ledgerRepository.save(ledger);
    }

    public Ledger findByLedgerNo(int ledgerNo) {
        return ledgerRepository.findByLedgerNo(ledgerNo);
    }

    public Date findMinLedgerDateByBranchNo(int branchNo) {
        return ledgerRepository.findMinLedgerDateByBranchNo(branchNo);
    }

    public Date findMaxLedgerDateByBranchNo(int branchNo) {
        return ledgerRepository.findMaxLedgerDateByBranchNo(branchNo);
    }

    public Map<Integer, IncomeExpenseBean> findTotalIncomeExpense(int branchNo, String fromDateUnformat, String toDateUnformat) {
        Map<Integer, IncomeExpenseBean> incomeExpenseBeanMap = new LinkedHashMap<Integer, IncomeExpenseBean>();
        Date fromDate = null, toDate = null;
        if (fromDateUnformat != null && toDateUnformat != null) {
            fromDate = Date.valueOf(fromDateUnformat.substring(6, 10) + fromDateUnformat.substring(2, 5) + "-" + fromDateUnformat.substring(0, 2));
            toDate = Date.valueOf(toDateUnformat.substring(6, 10) + toDateUnformat.substring(2, 5) + "-" + toDateUnformat.substring(0, 2));

            if (fromDate.getYear() != toDate.getYear()) {
                //Report as year
                for (int i = fromDate.getYear(); i <= toDate.getYear(); i++) {
                    IncomeExpenseBean incomeExpenseBean = new IncomeExpenseBean();
                    double income = ledgerRepository.sumLedgerByBranchNoAndLedgerPayType(branchNo, LedgerPay.INCOME);
                    double expense = ledgerRepository.sumLedgerByBranchNoAndLedgerPayType(branchNo, LedgerPay.EXPENSE);
                    if (income != 0 && expense != 0) {
                        incomeExpenseBeanMap.put(i, incomeExpenseBean);
                    }
                }
            } else {
                if (fromDate.getMonth() != toDate.getMonth()) {
                    //Report as month

                } else {
                    //Report as date

                }
            }
        }

//        List<Ledger> ledgers = ledgerRepository.findByBranchNoAndDateIsBetween(branchNo, fromDate, toDate);
//        for (Ledger l : ledgers) {
//            IncomeExpenseBean incomeExpenseBean = new IncomeExpenseBean();
//            double income = 0, expense = 0;
//            incomeExpenseBean.setIncome(income);
//            incomeExpenseBean.setExpense(expense);
//            if (income != 0 && expense != 0) {
//                incomeExpenseBeanMap.put(iterator, incomeExpenseBean);
//            }
//        }
        return incomeExpenseBeanMap;
    }
}