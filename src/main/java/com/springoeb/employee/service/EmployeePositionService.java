package com.springoeb.employee.service;

import com.springoeb.employee.model.EmployeePosition;
import com.springoeb.employee.repository.EmployeePositionRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EmployeePositionService {
    @Autowired
    private EmployeePositionRepository employeePositionRepository;

    public List<EmployeePosition> findAll(){
        return employeePositionRepository.findAll();
    }

    public void save(EmployeePosition employeePosition){
        employeePositionRepository.save(employeePosition);
    }

    public void removeByEmpPosNo(int empPosNo){
        employeePositionRepository.removeByEmpPosNo(empPosNo);
    }

    public EmployeePosition findByEmpPosNo(int empPosNo){
        return employeePositionRepository.findByEmpPosNo(empPosNo);
    }

    public boolean chkDuplicateEmpPosisitonName(String empPosName){
        List<EmployeePosition> employeePositions = employeePositionRepository.findAllByEmpPosName(empPosName);
        if(employeePositions.size() > 0){
            return true;
        }else{
            return false;
        }
    }
}
