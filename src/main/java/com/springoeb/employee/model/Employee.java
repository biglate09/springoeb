package com.springoeb.employee.model;

import com.springoeb.system.model.BranchUser;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;

/**
 * Created by bighead on 6/9/17.
 */
@Entity
public class Employee implements Serializable{
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer empNo;
    private String empName;
    private String empTel;
    private String empType; // Full-time,Part-time,Training
    private String payType; // วัน,ชั่วโมง
    private double pay;
    private String empGender;
    private String bgColor;
    private String fontColor;
    private Integer branchNo;
    @OneToMany(fetch = FetchType.LAZY, mappedBy = "employee")
    private List<EmployeePay> employeePays;
    @OneToMany(fetch = FetchType.LAZY, mappedBy = "employee")
    private List<WorkHistory> workHistories;
    @OneToOne(mappedBy = "employee")
    private BranchUser branchUser;

    public static String FULL_TIME = "1";
    public static String PART_TIME = "2";
    public static String TRAINING = "3";
    public static String HOUR = "1";
    public static String DAY = "2";
    public static String MALE = "M";
    public static String FEMALE = "F";

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

    public String getEmpGender() {
        return empGender;
    }

    public void setEmpGender(String empGender) {
        this.empGender = empGender;
    }

    public String getBgColor() {
        return bgColor;
    }

    public void setBgColor(String bgColor) {
        this.bgColor = bgColor;
    }

    public String getFontColor() {
        return fontColor;
    }

    public void setFontColor(String fontColor) {
        this.fontColor = fontColor;
    }

    public Integer getBranchNo() {
        return branchNo;
    }

    public void setBranchNo(Integer branchNo) {
        this.branchNo = branchNo;
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

    public BranchUser getBranchUser() {
        return branchUser;
    }

    public void setBranchUser(BranchUser branchUser) {
        this.branchUser = branchUser;
    }
}
