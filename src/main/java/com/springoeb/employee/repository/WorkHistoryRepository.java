package com.springoeb.employee.repository;

import com.springoeb.employee.model.WorkHistory;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.sql.Date;
import java.util.List;

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
    @Query("select sum(w.workPay) from WorkHistory w join w.employee e where w.workDate = ?1 and e.branchNo = ?2")
    Double sumWorkPayByWorkDateAndBranchNo(Date date,int branchNo);
    @Query("select min(w.workDate) from WorkHistory w join w.employee e where e.branchNo = ?1")
    Date findMinWorkHistDateByBranchNo(int branchNo);
    @Query("select max(w.workDate) from WorkHistory w join w.employee e where e.branchNo = ?1")
    Date findMaxWorkHistDateByBranchNo(int branchNo);
    @Query("select sum(w.workPay) from WorkHistory w join w.employee e where e.branchNo = ?1 and w.workDate between ?2 and ?3")
    Double sumWorkPayByBranchNoAndDateIsBetween(int branchNo, Date fromDate, Date toDate);
}