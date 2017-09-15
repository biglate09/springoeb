package com.springoeb.branch.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.springoeb.employee.model.Employee;
import com.springoeb.system.model.BranchUser;

import javax.persistence.*;
import java.util.List;

@Entity
public class Branch {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer branchNo;
    private String branchName;
    private String branchDesc;
    private String addressName;
    private Integer districtNo;
    private Integer subDistrictNo;
    private String road;
    private Integer provinceNo;
    private Integer zipNo;
    private String tel;
    private String line;
    private String fb;
    private boolean hasAdmin;

    public static int MAIN_BRANCH = 1;

    @JsonIgnore
    @OneToMany(fetch = FetchType.LAZY, mappedBy = "branch")
    private List<BranchUser> branchUsers;

    @JsonIgnore
    @OneToMany(fetch = FetchType.LAZY, mappedBy = "branch")
    private List<Employee> employees;

    public Integer getBranchNo() {
        return branchNo;
    }

    public void setBranchNo(Integer branchNo) {
        this.branchNo = branchNo;
    }

    public String getBranchName() {
        return branchName;
    }

    public void setBranchName(String branchName) {
        this.branchName = branchName;
    }

    public String getBranchDesc() {
        return branchDesc;
    }

    public void setBranchDesc(String branchDesc) {
        this.branchDesc = branchDesc;
    }

    public String getAddressName() {
        return addressName;
    }

    public void setAddressName(String addressName) {
        this.addressName = addressName;
    }

    public Integer getDistrictNo() {
        return districtNo;
    }

    public void setDistrictNo(Integer districtNo) {
        this.districtNo = districtNo;
    }

    public Integer getSubDistrictNo() {
        return subDistrictNo;
    }

    public void setSubDistrictNo(Integer subDistrictNo) {
        this.subDistrictNo = subDistrictNo;
    }

    public String getRoad() {
        return road;
    }

    public void setRoad(String road) {
        this.road = road;
    }

    public Integer getProvinceNo() {
        return provinceNo;
    }

    public void setProvinceNo(Integer provinceNo) {
        this.provinceNo = provinceNo;
    }

    public Integer getZipNo() {
        return zipNo;
    }

    public void setZipNo(Integer zipNo) {
        this.zipNo = zipNo;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getLine() {
        return line;
    }

    public void setLine(String line) {
        this.line = line;
    }

    public String getFb() {
        return fb;
    }

    public void setFb(String fb) {
        this.fb = fb;
    }

    public List<BranchUser> getBranchUsers() {
        return branchUsers;
    }

    public void setBranchUsers(List<BranchUser> branchUsers) {
        this.branchUsers = branchUsers;
    }

    public boolean isHasAdmin() {
        return hasAdmin;
    }

    public void setHasAdmin(boolean hasAdmin) {
        this.hasAdmin = hasAdmin;
    }
}
