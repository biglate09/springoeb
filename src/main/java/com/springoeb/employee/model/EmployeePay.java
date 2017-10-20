package com.springoeb.employee.model;

import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.*;
import java.io.Serializable;
import java.sql.Timestamp;

@Entity(name = "EmployeePay")
public class EmployeePay implements Serializable{
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "empPayNo")
    private Integer empPayNo;
    @Column(name = "pay")
    private Double pay;
    @Column(name = "date")
    private Timestamp date;

    @Column(name = "empNo",updatable = true,insertable = true)
    private Integer empNo;

    @JsonIgnore
    @ManyToOne
    @JoinColumn(name = "empNo",updatable = false,insertable = false)
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
