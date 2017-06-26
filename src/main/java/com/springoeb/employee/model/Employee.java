package com.springoeb.employee.model;

import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.*;
import java.util.List;

/**
 * Created by bighead on 6/9/17.
 */
@Entity
public class Employee {
    @Id
    private int empNo;
    private String empName;
    private String empTel;
    private String empType; // Full-time,Part-time,Training
    private String payType; // วัน,ชั่วโมง
    private double pay;
    private String empGender;
    private int branchNo;
    @OneToMany(fetch = FetchType.LAZY, mappedBy = "employee")
    private List<EmployeePay> employeePays;
    @OneToMany(fetch = FetchType.LAZY, mappedBy = "employee")
    private List<WorkHistory> workHistories;

    public static String FULL_TIME = "1";
    public static String PART_TIME = "2";
    public static String TRAINING = "3";
    public static String HOUR = "1";
    public static String DAY = "2";
    public static String MALE = "M";
    public static String FEMALE = "F";

    public int getEmpNo() {
        return empNo;
    }

    public void setEmpNo(int empNo) {
        this.empNo = empNo;
    }

    public String getEmpName() {
        return empName;
    }

    public void setEmpName(String empName) {
        this.empName = empName;
    }

    public String getEmpTel() {
        return empTel;
    }

    public void setEmpTel(String empTel) {
        this.empTel = empTel;
    }

    public String getEmpType() {
        return empType;
    }

    public void setEmpType(String empType) {
        this.empType = empType;
    }

    public String getPayType() {
        return payType;
    }

    public void setPayType(String payType) {
        this.payType = payType;
    }

    public double getPay() {
        return pay;
    }

    public void setPay(double pay) {
        this.pay = pay;
    }

    public int getBranchNo() {
        return branchNo;
    }

    public void setBranchNo(int branchNo) {
        this.branchNo = branchNo;
    }

    public String getEmpGender() {
        return empGender;
    }

    public void setEmpGender(String empGender) {
        this.empGender = empGender;
    }

    public List<EmployeePay> getEmployeePays() {
        return employeePays;
    }

    public void setEmployeePays(List<EmployeePay> employeePays) {
        this.employeePays = employeePays;
    }

    public List<WorkHistory> getWorkHistories() {
        return workHistories;
    }

    public void setWorkHistories(List<WorkHistory> workHistories) {
        this.workHistories = workHistories;
    }

    @Override
    public String toString() {
        return "Employee{" +
                "empNo=" + empNo +
                ", empName='" + empName + '\'' +
                ", empTel='" + empTel + '\'' +
                ", empType='" + empType + '\'' +
                ", payType='" + payType + '\'' +
                ", pay=" + pay +
                ", empGender='" + empGender + '\'' +
                ", branchNo=" + branchNo +
                ", employeePays=" + employeePays +
                ", workHistories=" + workHistories +
                '}';
    }
}
