package com.springoeb.employee.service;

import com.springoeb.employee.model.EmployeeTable;
import com.springoeb.employee.repository.EmployeeTableRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Date;
import java.sql.Time;
import java.util.List;

@Service
public class EmployeeTableService {
    @Autowired
    public EmployeeTableRepository employeeTableRepository;

    public List<EmployeeTable> findAll(int branchNo){
        return employeeTableRepository.findAllByEmployee_BranchNo(branchNo);
    }

    public void save(Iterable<EmployeeTable> employeeTables){
        employeeTableRepository.save(employeeTables);
    }

    public List<EmployeeTable> findEmployeeTableNow(int branchNo, Date date, Time timeNow){
        return employeeTableRepository.findAllByEmployee_BranchNoAndDateAndTimeStartBeforeAndTimeEndAfter(branchNo,date,timeNow,timeNow);
    }

    public void removeByEmpTimeNoAndBranchNo(int empTimeNo, int branchNo){
        employeeTableRepository.removeByEmpTimeNoAndEmployee_BranchNo(empTimeNo, branchNo);
    }
}
