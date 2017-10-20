package com.springoeb.employee.model;

import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;

@Entity(name = "EmployeePosition")
public class EmployeePosition implements Serializable{
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "empPosNo")
    private Integer empPosNo;
    @Column(name = "empPosName")
    private String empPosName;
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

    public List<EmployeeTable> getEmployeeTables() {
        return employeeTables;
    }

    public void setEmployeeTables(List<EmployeeTable> employeeTables) {
        this.employeeTables = employeeTables;
    }
}
