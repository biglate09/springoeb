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
    List<EmployeeTable> findAllByEmployee_BranchNoAndDateAndTimeStartBeforeAndTimeEndAfter(int branchNo, Date date , Time startTime, Time endTime);
    void removeByEmpTimeNoAndEmployee_BranchNo(int empTimeNo, int branchNo);
}
