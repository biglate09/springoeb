package com.springoeb.employee.model;

import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.*;
import java.sql.Timestamp;

/**
 * Created by bighead on 6/9/17.
 */
@Entity
public class EmployeePay {
    @Id
    private int empPayNo;
    private double pay;
    private Timestamp date;

    @Column(name = "emp_no",updatable = true,insertable = true)
    private int empNo;

    @JsonIgnore
    @ManyToOne
    @JoinColumn(name = "emp_no",updatable = false,insertable = false)
    private Employee employee;

    public int getEmpPayNo() {
        return empPayNo;
    }

    public void setEmpPayNo(int empPayNo) {
        this.empPayNo = empPayNo;
    }

    public double getPay() {
        return pay;
    }

    public void setPay(double pay) {
        this.pay = pay;
    }

    public Timestamp getDate() {
        return date;
    }

    public void setDate(Timestamp date) {
        this.date = date;
    }

    public int getEmpNo() {
        return empNo;
    }

    public void setEmpNo(int empNo) {
        this.empNo = empNo;
    }

    public Employee getEmployee() {
        return employee;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
    }
}
