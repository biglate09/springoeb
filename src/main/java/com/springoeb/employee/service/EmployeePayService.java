package com.springoeb.employee.service;

import com.springoeb.employee.model.EmployeePay;
import com.springoeb.employee.repository.EmployeePayRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EmployeePayService {
    @Autowired
    private EmployeePayRepository employeePayRepository;

    public List<EmployeePay> findAll(){
        return employeePayRepository.findAll();
    }
}
