package com.springoeb.system.model;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Branch {
    @Id
    private Integer branchNo;
    private String branchName;

    public static int MAIN_BRANCH = 1;

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
}
