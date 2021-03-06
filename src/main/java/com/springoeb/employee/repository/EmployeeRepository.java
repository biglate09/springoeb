package com.springoeb.employee.repository;

import com.springoeb.employee.model.Employee;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by bighead on 6/9/17.
 */
@Repository
public interface EmployeeRepository extends CrudRepository<Employee,Integer>{
    Employee save(Employee employee);
    List<Employee> findAll();
    List<Employee> findByBranchNo(int branchNo);
    void removeByEmpNoAndBranchNo(int empNo,int branchNo);
    Employee findByEmpNoAndBranchNo(int empNo,int branchNo);
    Employee findByEmpNo(int empNo);
    List<Employee> findAllByEmpNo(int empNo);
    List<Employee> findByEmpNameIgnoreCaseAndBranchNo(String empName,int branchNo);
}
