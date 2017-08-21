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

    public boolean canDeleteEmpPos(int empPosNo){
        List<EmployeeTable> employeeTables = employeeTableRepository.findAllByEmpPosNo(empPosNo);
        if(employeeTables != null && employeeTables.size() != 0){
            return false;
        }else{
            return true;
        }
    }

    public void save(Iterable<EmployeeTable> employeeTables){
        employeeTableRepository.save(employeeTables);
    }

    public List<EmployeeTable> findEmployeeTableNow(int branchNo, Date date){
//        return employeeTableRepository.findAllByEmployee_BranchNoAndDateAndTimeStartBeforeAndTimeEndAfter(branchNo,date,timeNow,timeNow);
        return employeeTableRepository.findAllByEmployee_BranchNoAndDate(branchNo,date);
    }

    public void removeByEmpTimeNoAndBranchNo(int empTimeNo, int branchNo){
        employeeTableRepository.removeByEmpTimeNoAndEmployee_BranchNo(empTimeNo, branchNo);
    }

    public boolean chkDuplicateEmployeeTable(int branchNo,int empNo,Date date,Time startTime,Time endTime){
        List<EmployeeTable> employeeTables = employeeTableRepository.findAllByEmployee_BranchNoAndEmpNoAndDateAndTimeStartBeforeAndTimeEndAfter(branchNo,empNo,date,endTime,startTime);
        if(employeeTables.size() > 0 || endTime.getTime() < startTime.getTime()){
            return true;
        }else{
            return false;
        }
    }

    public List<EmployeeTable> findAllByDate(Date date){
        return employeeTableRepository.findAllByDate(date);
    }
}
