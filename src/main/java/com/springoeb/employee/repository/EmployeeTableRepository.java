package com.springoeb.employee.repository;

import com.springoeb.employee.model.EmployeeTable;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.sql.Date;
import java.sql.Time;
import java.util.List;

/**
 * Created by bighead on 6/9/17.
 */
@Repository
public interface EmployeeTableRepository extends CrudRepository<EmployeeTable,Integer> {
    List<EmployeeTable> findAllByEmployee_BranchNo(int branchNo);
    List<EmployeeTable> findAllByEmpPosNo(int empPosNo);
    List<EmployeeTable> findAllByEmployee_BranchNoAndDateAndTimeStartBeforeAndTimeEndAfter(int branchNo, Date date , Time startTime, Time endTime);
    List<EmployeeTable> findAllByEmployee_BranchNoAndDate(int branchNo, Date date);
    List<EmployeeTable> findAllByEmployee_BranchNoAndEmpNoAndDateAndTimeStartBeforeAndTimeEndAfter(int branchNo,int empNo,Date date,Time startTime,Time endTime);
    List<EmployeeTable> findAllByDate(Date date);
    void removeByEmpTimeNoAndEmployee_BranchNo(int empTimeNo, int branchNo);
}