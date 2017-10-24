package com.springoeb.employee.repository;

import com.springoeb.employee.model.EmployeePosition;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface EmployeePositionRepository extends CrudRepository<EmployeePosition,Integer>{
    List<EmployeePosition> findAll();
    List<EmployeePosition> findByRestNo(int restNo);
    List<EmployeePosition> findAllByEmpPosName(String empPosName);
    void removeByEmpPosNo(int empPosNo);
    EmployeePosition findByEmpPosNo(int empPosNo);
}
