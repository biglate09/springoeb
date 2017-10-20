package com.springoeb.employee.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import org.jetbrains.annotations.Nullable;

import javax.persistence.*;
import java.io.Serializable;
import java.sql.Date;
import java.sql.Time;

@Entity(name = "WorkHistory")
public class WorkHistory implements Serializable{
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "workHistNo")
    private Integer workHistNo;
    @Column(name = "workDate")
    private Date workDate;
    @Column(name = "workStart")
    private Time workStart;
    @Column(name = "workEnd")
    private Time workEnd;
    @Column(name = "workPay")
    private Double workPay;
    @Column(name = "workHour")
    private Integer workHour;
    @Column(name = "workMin")
    private Integer workMin;

    @Column(name = "empNo",updatable = true,insertable = true)
    private Integer empNo;

    @Transient
    private String empName;

    @Column(name = "empTableNo",updatable = true,insertable = true)
    @Nullable
    private Integer empTimeNo;

    @JsonIgnore
    @OneToOne
    @JoinColumn(name = "empTableNo",updatable = false,insertable = false)
    private EmployeeTable employeeTable;

    @JsonIgnore
    @ManyToOne
    @JoinColumn(name = "empNo",updatable = false,insertable = false)
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

    public Time getWorkStart() {
        return workStart;
    }

    @Nullable
    public Integer getEmpTimeNo() {
        return empTimeNo;
    }

    public void setEmpTimeNo(@Nullable Integer empTimeNo) {
        this.empTimeNo = empTimeNo;
    }

    public EmployeeTable getEmployeeTable() {
        return employeeTable;
    }

    public void setEmployeeTable(EmployeeTable employeeTable) {
        this.employeeTable = employeeTable;
    }

    public void setWorkStart(Time workStart) {
        this.workStart = workStart;
    }

    public Time getWorkEnd() {
        return workEnd;
    }

    public void setWorkEnd(Time workEnd) {
        this.workEnd = workEnd;
    }
}
