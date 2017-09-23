package com.springoeb.employee.repository;

import com.springoeb.employee.model.WorkHistory;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.sql.Date;
import java.util.List;

/**
 * Created by bighead on 6/9/17.
 */
@Repository
public interface WorkHistoryRepository extends CrudRepository<WorkHistory,Integer>{
    WorkHistory findByWorkHistNoAndEmployee_BranchNo(int workHistNo, int branchNo);
    List<WorkHistory> findByEmpNo(int empNo);
    List<WorkHistory> findByEmployee_BranchNoAndWorkPayIsNotNullOrderByWorkDateDescWorkHistNoDesc(int branchNo);
    List<WorkHistory> findByEmployee_BranchNoAndEmployee_EmpNo(int branchNo,int empNo);
    List<WorkHistory> findByWorkDate(Date date);
    List<WorkHistory> findByWorkDateBetween(Date d1, Date d2);
    List<WorkHistory> findByEmpNoAndWorkDateBetween(int empNo,Date d1, Date d2);
    void removeByWorkHistNoAndEmployee_BranchNo(int workHistNo,int branchNo);
}