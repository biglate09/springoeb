package com.springoeb.employee.model;

import com.sun.istack.internal.Nullable;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import java.util.List;

/**
 * Created by bighead on 6/9/17.
 */
@Entity
public class Employee {
    @Id
    private String empName;
    @Nullable
    private String empTel;
    private String empType; // Full-time,Part-time,Training
    private String payType; // วัน,ชั่วโมง
    private double pay;
    private int branchNo;
    @OneToMany(mappedBy = "employee", cascade = CascadeType.ALL)
    private List<EmployeeTable> employeeTables;
    @OneToMany(mappedBy = "employee", cascade = CascadeType.ALL)
    private List<EmployeePay> employeePays;
    @OneToMany(mappedBy = "employee", cascade = CascadeType.ALL)
    private List<WorkHistory> workHistories;

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

    public List<EmployeeTable> getEmployeeTables() {
        return employeeTables;
    }

    public void setEmployeeTables(List<EmployeeTable> employeeTables) {
        this.employeeTables = employeeTables;
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
                "empName='" + empName + '\'' +
                ", empTel='" + empTel + '\'' +
                ", empType='" + empType + '\'' +
                ", payType='" + payType + '\'' +
                ", pay=" + pay +
                ", branchNo=" + branchNo +
                ", employeeTables=" + employeeTables +
                ", employeePays=" + employeePays +
                ", workHistories=" + workHistories +
                '}';
    }
}
