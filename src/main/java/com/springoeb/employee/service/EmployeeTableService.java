package com.springoeb.employee.service;

import com.springoeb.employee.model.EmployeeTable;
import com.springoeb.employee.repository.EmployeeTableRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EmployeeTableService {
    @Autowired
    public EmployeeTableRepository employeeTableRepository;

    public List<EmployeeTable> findAll(){
        return employeeTableRepository.findAll();
    }
}
