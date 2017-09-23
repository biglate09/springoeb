package com.springoeb.employee.service;

import com.springoeb.employee.model.WorkHistory;
import com.springoeb.employee.repository.WorkHistoryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Date;
import java.util.List;

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

    public double getWorkSum(int branchNo,int empNo){
        List<WorkHistory> workHistories = workHistoryRepository.findByEmployee_BranchNoAndEmployee_EmpNo(branchNo,empNo);
        double sum = 0;
        for(WorkHistory wh : workHistories){
            sum += wh.getWorkPay();
        }
        return sum;
    }

    public List<WorkHistory> findByEmpNo(int empNo){
        return workHistoryRepository.findByEmpNo(empNo);
    }
}
