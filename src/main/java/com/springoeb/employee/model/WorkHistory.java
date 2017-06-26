package com.springoeb.employee.model;

import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.*;
import java.io.Serializable;
import java.sql.Date;
import java.sql.Timestamp;

/**
 * Created by bighead on 6/9/17.
 */
@Entity
public class WorkHistory implements Serializable{
    @Id
    private int workHistNo;
    private Date workDate;
    private Timestamp workStart;
    private Timestamp workEnd;
    private Double workPay;
    private Double workHour;

    @Column(name = "emp_no",updatable = true,insertable = true)
    private int empNo;

    @JsonIgnore
    @ManyToOne
    @JoinColumn(name = "emp_no",updatable = false,insertable = false)
    private Employee employee;

    public Date getWorkDate() {
        return workDate;
    }

    public void setWorkDate(Date workDate) {
        this.workDate = workDate;
    }

    public int getWorkHistNo() {
        return workHistNo;
    }

    public void setWorkHistNo(int workHistNo) {
        this.workHistNo = workHistNo;
    }

    public Timestamp getWorkStart() {
        return workStart;
    }

    public void setWorkStart(Timestamp workStart) {
        this.workStart = workStart;
    }

    public Timestamp getWorkEnd() {
        return workEnd;
    }

    public void setWorkEnd(Timestamp workEnd) {
        this.workEnd = workEnd;
    }

    public Double getWorkPay() {
        return workPay;
    }

    public void setWorkPay(Double workPay) {
        this.workPay = workPay;
    }

    public Double getWorkHour() {
        return workHour;
    }

    public void setWorkHour(Double workHour) {
        this.workHour = workHour;
    }

    public Employee getEmployee() {
        return employee;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
    }

    public int getEmpNo() {
        return empNo;
    }

    public void setEmpNo(int empNo) {
        this.empNo = empNo;
    }

    @Override
    public String toString() {
        return "WorkHistory{" +
                "workHistNo=" + workHistNo +
                ", workDate=" + workDate +
                ", workStart=" + workStart +
                ", workEnd=" + workEnd +
                ", workPay=" + workPay +
                ", workHour=" + workHour +
                ", empNo=" + empNo +
                ", employee=" + employee +
                '}';
    }
}
