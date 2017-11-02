package com.springoeb.employee.service;

import com.springoeb.employee.model.WorkHistory;
import com.springoeb.employee.repository.WorkHistoryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

@Service
public class WorkHistoryService {
    @Autowired
    public WorkHistoryRepository workHistoryRepository;

    public List<WorkHistory> findAll(int branchNo){
        return workHistoryRepository.findByEmployee_BranchNoAndWorkPayIsNotNullOrderByWorkDateDescWorkHistNoDesc(branchNo);
    }

//    public WorkHistory findByWorkHistNo(int workHistNo){
//        return workHistoryRepository.findByWorkHistNo(workHistNo);
//    }

    public WorkHistory getWorkHistory(int workHistNo,int branchNo){
        return workHistoryRepository.findByWorkHistNoAndEmployee_BranchNo(workHistNo,branchNo);
    }

    public List<WorkHistory> findByWorkDate(Date date){
        return workHistoryRepository.findByWorkDate(date);
    }
    public List<WorkHistory> findByWorkDate(Date date1,Date date2){
        return workHistoryRepository.findByWorkDateBetween(date1,date2);
    }

    public List<WorkHistory> findByEmpNoAndWorkDate(int empNo,Date date1,Date date2){
        return workHistoryRepository.findByEmpNoAndWorkDateBetween(empNo,date1,date2);
    }

    public void removeByWorkHist(int workHistNo,int branchNo){
        workHistoryRepository.removeByWorkHistNoAndEmployee_BranchNo(workHistNo,branchNo);
    }

    public void save(WorkHistory workHistory){
        workHistoryRepository.save(workHistory);
    }

    public void save(Iterable<WorkHistory> iWorkHistories){
        workHistoryRepository.save(iWorkHistories);
    }

    public Date findMinWorkHistDateByBranchNo(int branchNo){
        return workHistoryRepository.findMinWorkHistDateByBranchNo(branchNo);
    }

    public Date findMaxWorkHistDateByBranchNo(int branchNo){
        return workHistoryRepository.findMaxWorkHistDateByBranchNo(branchNo);
    }

    public double getWorkSum(int branchNo,int empNo){
        List<WorkHistory> workHistories = workHistoryRepository.findByEmployee_BranchNoAndEmployee_EmpNo(branchNo,empNo);
        double sum = 0;
        for(WorkHistory wh : workHistories){
            sum += wh.getWorkPay();
        }
        return sum;
    }

    public Map<Integer,Double> getEmpPayReport(int branchNo,String fromDateUnformat,String toDateUnformat){
        Map<Integer, Double> empPayMap = new LinkedHashMap<Integer, Double>();
        Date fromDate = null, toDate = null;
        if (fromDateUnformat != null && toDateUnformat != null) {
            fromDate = Date.valueOf(fromDateUnformat.substring(6, 10) + fromDateUnformat.substring(2, 5) + "-" + fromDateUnformat.substring(0, 2));
            toDate = Date.valueOf(toDateUnformat.substring(6, 10) + toDateUnformat.substring(2, 5) + "-" + toDateUnformat.substring(0, 2));

            if (1900 + fromDate.getYear() != 1900 + toDate.getYear()) {
                //Report as year
                for (int year = 1900 + fromDate.getYear(); year <= 1900 + toDate.getYear(); year++) {
                    Double money = workHistoryRepository.sumWorkPayByBranchNoAndDateIsBetween(branchNo, Date.valueOf(year + "-01-01"), Date.valueOf(year + "-12-31"));
                    if (money != null && money != 0) {
                        empPayMap.put(year, money);
                    }
                }
            } else {
                if (fromDate.getMonth() + 1 != toDate.getMonth() + 1) {
                    //Report as month
                    for (int month = fromDate.getMonth() + 1; month <= toDate.getMonth() + 1; month++) {
                        Double money = workHistoryRepository.sumWorkPayByBranchNoAndDateIsBetween(branchNo, Date.valueOf(1900 + fromDate.getYear() + "-" + month + "-01"), Date.valueOf(1900 + toDate.getYear() + "-" + month + "-31"));
                        if (money != null && money != 0) {
                            empPayMap.put(month, money);
                        }
                    }
                } else {
                    //Report as date
                    for (int date = fromDate.getDate(); date <= toDate.getDate(); date++) {
                        Double money = workHistoryRepository.sumWorkPayByBranchNoAndDateIsBetween(branchNo, Date.valueOf(1900 + fromDate.getYear() + "-" + (fromDate.getMonth() + 1) + "-" + date), Date.valueOf(1900 + toDate.getYear() + "-" + (toDate.getMonth() + 1) + "-" + date));
                        if (money != null && money != 0) {
                            empPayMap.put(date, money);
                        }
                    }
                }
            }
        }

        return empPayMap;
    }

    public List<WorkHistory> findByEmpNo(int empNo){
        return workHistoryRepository.findByEmpNo(empNo);
    }
}
