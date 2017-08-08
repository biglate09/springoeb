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
        return employeePositionRepository.findAllByAvailable(1);
    }

    public void unused(EmployeePosition employeePosition){
        employeePosition.setAvailable(0);
        employeePositionRepository.save(employeePosition);
    }

    public void save(EmployeePosition employeePosition){
        employeePosition.setAvailable(1);
        employeePositionRepository.save(employeePosition);
    }

    public void removeByEmpPosNo(int empPosNo){
        employeePositionRepository.removeByEmpPosNo(empPosNo);
    }

    public EmployeePosition findByEmpPosNo(int empPosNo){
        return employeePositionRepository.findByEmpPosNoAndAvailable(empPosNo,1);
    }

    public boolean chkDuplicateEmpPosisitonName(String empPosName, int available){
        List<EmployeePosition> employeePositions = employeePositionRepository.findAllByEmpPosNameAndAvailable(empPosName,available);
        if(employeePositions.size() > 0){
            return true;
        }else{
            return false;
        }
    }
}
