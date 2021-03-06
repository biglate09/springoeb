package com.springoeb.employee.repository;

import com.springoeb.employee.model.EmployeePay;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by bighead on 6/9/17.
 */
@Repository
public interface EmployeePayRepository extends CrudRepository<EmployeePay,Integer>{
    List<EmployeePay> findByEmployee_BranchNoAndEmpNoOrderByDateDesc(int branchNo,int empNo);
}
