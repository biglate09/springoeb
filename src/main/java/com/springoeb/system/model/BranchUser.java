package com.springoeb.system.model;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class BranchUser {
    @Id
    private Integer branchUserNo;
    private String username;
    private String password;
    private Integer branchNo;
    private Integer roleNo;

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

    @Override
    public String toString() {
        return "BranchUser{" +
                "branchUserNo=" + branchUserNo +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", branchNo=" + branchNo +
                ", roleNo=" + roleNo +
                '}';
    }
}
