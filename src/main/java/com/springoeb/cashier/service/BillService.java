package com.springoeb.cashier.service;

import com.springoeb.cashier.model.Bill;
import com.springoeb.cashier.repository.BillRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Date;
import java.sql.Time;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

@Service
public class BillService {
    @Autowired
    private BillRepository billRepository;

    public List<Bill> findByTable_BranchNo(int branchNo) {
        return billRepository.findByTable_BranchNoAndStatus(branchNo,Bill.UNPAID);
    }

    public List<Bill> findByAllTable_BranchNo(int branchNo){
        return billRepository.findByTable_BranchNoAndStatus(branchNo,Bill.PAID);
    }

    public Bill findByBillNo(int billNo) {
        return billRepository.findByBillNo(billNo);
    }

    public Date findMinDateByBranchNo(int branchNo) {
        return billRepository.findMinDateByBranchNo(branchNo, Bill.PAID);
    }

    public Date findMaxDateByBranchNo(int branchNo) {
        return billRepository.findMaxDateByBranchNo(branchNo, Bill.PAID);
    }

    public Map<Integer, Double> getBillReport(int branchNo, String fromDateUnformat, String toDateUnformat) {
        Map<Integer, Double> billMap = new LinkedHashMap<Integer, Double>();
        Date fromDate = null, toDate = null;
        if (fromDateUnformat != null && toDateUnformat != null) {
            fromDate = Date.valueOf(fromDateUnformat.substring(6, 10) + fromDateUnformat.substring(2, 5) + "-" + fromDateUnformat.substring(0, 2));
            toDate = Date.valueOf(toDateUnformat.substring(6, 10) + toDateUnformat.substring(2, 5) + "-" + toDateUnformat.substring(0, 2));

            if (1900 + fromDate.getYear() != 1900 + toDate.getYear()) {
                //Report as year
                for (int year = 1900 + fromDate.getYear(); year <= 1900 + toDate.getYear(); year++) {
                    Double money = billRepository.sumBillByBranchNoAndStatusAndDateIsBetween(branchNo, Bill.PAID, Date.valueOf(year + "-01-01"), Date.valueOf(year + "-12-31"));
                    if (money != null) {
                        billMap.put(year, money);
                    }
                }
            } else {
                if (fromDate.getMonth() + 1 != toDate.getMonth() + 1) {
                    //Report as month
                    for (int month = fromDate.getMonth() + 1; month <= toDate.getMonth() + 1; month++) {
                        Double money = billRepository.sumBillByBranchNoAndStatusAndDateIsBetween(branchNo, Bill.PAID, Date.valueOf(1900 + fromDate.getYear() + "-" + month + "-01"), Date.valueOf(1900 + toDate.getYear() + "-" + month + "-31"));
                        if (money != null) {
                            billMap.put(month, money);
                        }
                    }
                } else {
                    //Report as date
                    for (int date = fromDate.getDate(); date <= toDate.getDate(); date++) {
                        Double money = billRepository.sumBillByBranchNoAndStatusAndDateIsBetween(branchNo, Bill.PAID, Date.valueOf(1900 + fromDate.getYear() + "-" + (fromDate.getMonth() + 1) + "-" + date), Date.valueOf(1900 + toDate.getYear() + "-" + (toDate.getMonth() + 1) + "-" + date));
                        if (money != null) {
                            billMap.put(date, money);
                        }
                    }
                }
            }
        }

        return billMap;
    }

    public void save(Bill b){
        billRepository.save(b);
    }

    public Bill createNewBill(int tableNo){
        Bill bill = new Bill();
        bill.setBillDate(new Date(System.currentTimeMillis()));
        bill.setBillTime(new Time(System.currentTimeMillis()));
        bill.setTableNo(tableNo);
        bill.setStatus(Bill.UNPAID);
        return billRepository.save(bill);
    }

    public Double sumTotalAmountByDateAndBranchNo(Date date,int branchNo){
        return billRepository.sumTotalAmountByDateAndBranchNo(date, branchNo);
    }
}
