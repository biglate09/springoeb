package com.springoeb.employee.service;

import com.springoeb.employee.model.EmployeePay;
import com.springoeb.employee.repository.EmployeePayRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.util.List;

@Service
public class EmployeePayService {
    @Autowired
    private EmployeePayRepository employeePayRepository;

    public void save(EmployeePay employeePay){
        employeePay.setDate(new Timestamp(System.currentTimeMillis()));
        employeePayRepository.save(employeePay);
    }

    public double getPaySum(int branchNo,int empNo){
        List<EmployeePay> employeePays = employeePayRepository.findByEmployee_BranchNoAndEmpNoOrderByDateDesc(branchNo,empNo);
        double sum = 0;
        for(EmployeePay ep : employeePays){
            sum += ep.getPay();
        }
        return sum;
    }
}
