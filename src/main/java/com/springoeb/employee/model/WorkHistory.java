package com.springoeb.employee.model;

import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.*;
import java.io.Serializable;
import java.sql.Date;

/**
 * Created by bighead on 6/9/17.
 */
@Entity
public class WorkHistory implements Serializable{
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer workHistNo;
    private Date workDate;
    private Double workPay;
    private Integer workHour;
    private Integer workMin;

    @Column(name = "emp_no",updatable = true,insertable = true)
    private Integer empNo;

    @Transient
    private String empName;

    @JsonIgnore
    @ManyToOne
    @JoinColumn(name = "emp_no",updatable = false,insertable = false)
    private Employee employee;

    public Integer getWorkHistNo() {
        return workHistNo;
    }

    public void setWorkHistNo(Integer workHistNo) {
        this.workHistNo = workHistNo;
    }

    public Date getWorkDate() {
        return workDate;
    }

    public void setWorkDate(Date workDate) {
        this.workDate = workDate;
    }

    public Double getWorkPay() {
        return workPay;
    }

    public void setWorkPay(Double workPay) {
        this.workPay = workPay;
    }

    public Integer getWorkHour() {
        return workHour;
    }

    public void setWorkHour(Integer workHour) {
        this.workHour = workHour;
    }

    public Integer getWorkMin() {
        return workMin;
    }

    public void setWorkMin(Integer workMin) {
        this.workMin = workMin;
    }

    public Integer getEmpNo() {
        return empNo;
    }

    public void setEmpNo(Integer empNo) {
        this.empNo = empNo;
    }

    public String getEmpName() {
        return empName;
    }

    public void setEmpName(String empName) {
        this.empName = empName;
    }

    public Employee getEmployee() {
        return employee;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
    }
}
