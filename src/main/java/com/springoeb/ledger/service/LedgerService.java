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

            if (1900 + fromDate.getYear() != 1900 + toDate.getYear()) {
                //Report as year
                for (int year = 1900 + fromDate.getYear(); year <= 1900 + toDate.getYear(); year++) {
                    IncomeExpenseBean incomeExpenseBean = new IncomeExpenseBean();
                    Double income = ledgerRepository.sumLedgerByBranchNoAndLedgerPayTypeAndDateIsBetween(branchNo, LedgerPay.INCOME, Date.valueOf(year + "-01-01"), Date.valueOf(year + "-12-31"));
                    Double expense = ledgerRepository.sumLedgerByBranchNoAndLedgerPayTypeAndDateIsBetween(branchNo, LedgerPay.EXPENSE, Date.valueOf(year + "-01-01"), Date.valueOf(year + "-12-31"));
                    if (income != null || expense != null) {
                        incomeExpenseBean.setIncome(income != null ? income : 0);
                        incomeExpenseBean.setExpense(expense != null ? expense : 0);
                        incomeExpenseBeanMap.put(year, incomeExpenseBean);
                    }
                }
            } else {
                if (fromDate.getMonth() + 1 != toDate.getMonth() + 1) {
                    //Report as month
                    for (int month = fromDate.getMonth() + 1; month <= toDate.getMonth() + 1; month++) {
                        IncomeExpenseBean incomeExpenseBean = new IncomeExpenseBean();
                        Double income = ledgerRepository.sumLedgerByBranchNoAndLedgerPayTypeAndDateIsBetween(branchNo, LedgerPay.INCOME, Date.valueOf(1900 + fromDate.getYear()+"-"+month+"-01"), Date.valueOf(1900 + toDate.getYear()+"-"+month+"-31"));
                        Double expense = ledgerRepository.sumLedgerByBranchNoAndLedgerPayTypeAndDateIsBetween(branchNo, LedgerPay.EXPENSE,  Date.valueOf(1900 + fromDate.getYear()+"-"+month+"-01"), Date.valueOf(1900 + toDate.getYear()+"-"+month+"-31"));
                        if (income != null || expense != null) {
                            incomeExpenseBean.setIncome(income != null ? income : 0);
                            incomeExpenseBean.setExpense(expense != null ? expense : 0);
                            incomeExpenseBeanMap.put(month, incomeExpenseBean);
                        }
                    }
                } else {
                    //Report as date
                    for(int date = fromDate.getDate(); date <= toDate.getDate(); date++){
                        IncomeExpenseBean incomeExpenseBean = new IncomeExpenseBean();
                        Double income = ledgerRepository.sumLedgerByBranchNoAndLedgerPayTypeAndDateIsBetween(branchNo, LedgerPay.INCOME, Date.valueOf(1900 + fromDate.getYear()+"-"+(fromDate.getMonth() + 1)+"-"+date), Date.valueOf(1900 + toDate.getYear() + "-" + (toDate.getMonth() + 1) + "-"+date));
                        Double expense = ledgerRepository.sumLedgerByBranchNoAndLedgerPayTypeAndDateIsBetween(branchNo, LedgerPay.EXPENSE,  Date.valueOf(1900 + fromDate.getYear()+"-"+(fromDate.getMonth() + 1)+"-"+date), Date.valueOf(1900 + toDate.getYear() + "-" + (toDate.getMonth() + 1) + "-"+date));
                        if (income != null || expense != null) {
                            incomeExpenseBean.setIncome(income != null ? income : 0);
                            incomeExpenseBean.setExpense(expense != null ? expense : 0);
                            incomeExpenseBeanMap.put(date, incomeExpenseBean);
                        }
                    }
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

    public Ledger findByDateAndBranchNoAndLedgerTypeNo(Date date,int branchNo,int ledgerTypeNo){
        return ledgerRepository.findByDateAndBranchNoAndLedgerTypeNo(date,branchNo,ledgerTypeNo);
    }
}