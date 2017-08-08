package com.springoeb.employee.model;

import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.*;
import java.io.Serializable;
import java.sql.Timestamp;

/**
 * Created by bighead on 6/9/17.
 */
@Entity
public class EmployeePay implements Serializable{
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer empPayNo;
    private Double pay;
    private Timestamp date;

    @Column(name = "emp_no",updatable = true,insertable = true)
    private Integer empNo;

    @JsonIgnore
    @ManyToOne
    @JoinColumn(name = "emp_no",updatable = false,insertable = false)
    private Employee employee;

    public Integer getEmpPayNo() {
        return empPayNo;
    }

    public void setEmpPayNo(Integer empPayNo) {
        this.empPayNo = empPayNo;
    }

    public Double getPay() {
        return pay;
    }

    public void setPay(Double pay) {
        this.pay = pay;
    }

    public Timestamp getDate() {
        return date;
    }

    public void setDate(Timestamp date) {
        this.date = date;
    }

    public Integer getEmpNo() {
        return empNo;
    }

    public void setEmpNo(Integer empNo) {
        this.empNo = empNo;
    }

    public Employee getEmployee() {
        return employee;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
    }
}
