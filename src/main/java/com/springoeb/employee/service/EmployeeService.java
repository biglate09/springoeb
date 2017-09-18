package com.springoeb.employee.service;

import com.springoeb.employee.model.Employee;
import com.springoeb.employee.repository.EmployeeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by bighead on 6/9/17.
 */
@Service
public class EmployeeService {
    @Autowired
    private EmployeeRepository employeeRepository;

    public List<Employee> findByBranchNo(int branchNo){
        List<Employee> employees = employeeRepository.findByBranchNo(branchNo);
        return employees;
    }

    public Employee findByEmpNoAndBranchNo(int empNo,int branchNo){
        Employee employee = employeeRepository.findByEmpNoAndBranchNo(empNo,branchNo);
        return employee;
    }

    public Employee save(Employee employee){
        return employeeRepository.save(employee);
    }

    public void removeByEmpNoAndBranchNo(int empNo,int branchNo){
        employeeRepository.removeByEmpNoAndBranchNo(empNo,branchNo);
    }

    public boolean chkDuplicateEmpName(String empName,int branchNo){
        List<Employee> employees = employeeRepository.findByEmpNameIgnoreCaseAndBranchNo(empName,branchNo);
        if(employees.size() > 0) {
            return true;
        }else{
            return false;
        }
    }

    public List<Employee> findAll(){
        return employeeRepository.findAll();
    }

    public Employee findByEmpNo(int empNo){
        return employeeRepository.findByEmpNo(empNo);
    }
}
