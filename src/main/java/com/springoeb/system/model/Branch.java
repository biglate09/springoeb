package com.springoeb.system.model;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import java.util.List;

@Entity
public class Branch {
    @Id
    private Integer branchNo;
    private String branchName;

    public static int MAIN_BRANCH = 1;

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "branch")
    private List<BranchUser> branchUsers;

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
