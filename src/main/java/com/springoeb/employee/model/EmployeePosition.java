package com.springoeb.employee.model;

import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import java.io.Serializable;
import java.util.List;

/**
 * Created by bighead on 6/9/17.
 */
@Entity
public class EmployeePosition implements Serializable{
    @Id
    private int empPosNo;
    private String empPosName;
    @JsonIgnore
    @OneToMany(mappedBy = "employeePosition", cascade = CascadeType.ALL)
    private List<EmployeeTable> employeeTables;

    public int getEmpPosNo() {
        return empPosNo;
    }

    public void setEmpPosNo(int empPosNo) {
        this.empPosNo = empPosNo;
    }

    public String getEmpPosName() {
        return empPosName;
    }

    public void setEmpPosName(String empPosName) {
        this.empPosName = empPosName;
    }

    public List<EmployeeTable> getEmployeeTables() {
        return employeeTables;
    }

    public void setEmployeeTables(List<EmployeeTable> employeeTables) {
        this.employeeTables = employeeTables;
    }
}
