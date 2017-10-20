package com.springoeb.system.model;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.springoeb.branch.model.Branch;
import com.springoeb.employee.model.Employee;

import javax.persistence.*;

@Entity(name = "Branch_User")
public class BranchUser {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "branchUserNo")
    private Integer branchUserNo;
    @Column(name = "branchUsername")
    private String username;
    @JsonIgnore
    @Column(name = "branchPassword")
    private String password;
    @Column(name = "sentEmail")
    private String sentEmail;
    @Column(name = "branchNo", updatable = true,insertable = true)
    private Integer branchNo;
    @Column(name = "roleNo", updatable = true,insertable = true)
    private Integer roleNo;
    @Column(name = "empNo", updatable = true,insertable = true)
    private Integer empNo;

    @ManyToOne
    @JoinColumn(name = "branchNo",updatable = false,insertable = false)
    private Branch branch;

    @ManyToOne
    @JoinColumn(name = "roleNo",updatable = false,insertable = false)
    private Role role;

    @JsonBackReference
    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "empNo", updatable = false,insertable = false)
    private Employee employee;

    public Integer getBranchUserNo() {
        return branchUserNo;
    }

    public void setBranchUserNo(Integer branchUserNo) {
        this.branchUserNo = branchUserNo;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Integer getBranchNo() {
        return branchNo;
    }

    public void setBranchNo(Integer branchNo) {
        this.branchNo = branchNo;
    }

    public Integer getRoleNo() {
        return roleNo;
    }

    public void setRoleNo(Integer roleNo) {
        this.roleNo = roleNo;
    }

    public Branch getBranch() {
        return branch;
    }

    public void setBranch(Branch branch) {
        this.branch = branch;
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

    public String getSentEmail() {
        return sentEmail;
    }

    public void setSentEmail(String sentEmail) {
        this.sentEmail = sentEmail;
    }

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }
}
