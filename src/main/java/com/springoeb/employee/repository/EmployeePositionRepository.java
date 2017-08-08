package com.springoeb.employee.repository;

import com.springoeb.employee.model.EmployeePosition;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by bighead on 6/9/17.
 */
@Repository
public interface EmployeePositionRepository extends CrudRepository<EmployeePosition,Integer>{
    List<EmployeePosition> findAllByAvailable(int available);
    List<EmployeePosition> findAllByEmpPosNameAndAvailable(String empPosName, int avaialble);
    void removeByEmpPosNo(int empPosNo);
    EmployeePosition findByEmpPosNoAndAvailable(int empPosNo,int available);
}
