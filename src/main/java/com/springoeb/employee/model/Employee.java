package com.springoeb.employee.model;

import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.springoeb.branch.model.Branch;
import com.springoeb.system.model.BranchUser;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;

@Entity(name = "Employee")
public class Employee implements Serializable{
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "empNo")
    private Integer empNo;
    @Column(name = "empName")
    private String empName;
    @Column(name = "empTel")
    private String empTel;
    @Column(name = "empType")
    private String empType; // Full-time,Part-time,Training
    @Column(name = "payType")
    private String payType; // วัน,ชั่วโมง
    @Column(name = "pay")
    private double pay;
    @Column(name = "empGender")
    private String empGender;
    @Column(name = "bgColor")
    private String bgColor;
    @Column(name = "fontColor")
    private String fontColor;
    @Column(name = "branchNo",updatable = true,insertable = true)
    private Integer branchNo;
    @Column(name = "email")
    private String email;
    @OneToMany(fetch = FetchType.LAZY, mappedBy = "employee")
    private List<EmployeePay> employeePays;
    @OneToMany(fetch = FetchType.LAZY, mappedBy = "employee")
    private List<WorkHistory> workHistories;
    @JsonManagedReference
    @OneToOne(mappedBy = "employee",cascade = CascadeType.ALL)
    private BranchUser branchUser;
    @ManyToOne
    @JoinColumn(name = "branchNo",updatable = false,insertable = false)
    private Branch branch;

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

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Branch getBranch() {
        return branch;
    }

    public void setBranch(Branch branch) {
        this.branch = branch;
    }
}
