package com.springoeb.employee.model;

import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;

/**
 * Created by bighead on 6/9/17.
 */
@Entity
public class EmployeePosition implements Serializable{
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer empPosNo;
    private String empPosName;
    private Integer available;
    @JsonIgnore
    @OneToMany(mappedBy = "employeePosition", cascade = CascadeType.ALL)
    private List<EmployeeTable> employeeTables;

    public Integer getEmpPosNo() {
        return empPosNo;
    }

    public void setEmpPosNo(Integer empPosNo) {
        this.empPosNo = empPosNo;
    }

    public String getEmpPosName() {
        return empPosName;
    }

    public void setEmpPosName(String empPosName) {
        this.empPosName = empPosName;
    }

    public Integer getAvailable() {
        return available;
    }

    public void setAvailable(Integer available) {
        this.available = available;
    }

    public List<EmployeeTable> getEmployeeTables() {
        return employeeTables;
    }

    public void setEmployeeTables(List<EmployeeTable> employeeTables) {
        this.employeeTables = employeeTables;
    }
}
