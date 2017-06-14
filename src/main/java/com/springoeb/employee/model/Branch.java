package com.springoeb.employee.model;

import javax.persistence.Id;
import java.io.Serializable;

public class Branch implements Serializable{
    @Id
    private int branchNo;

    public int getBranchNo() {
        return branchNo;
    }

    public void setBranchNo(int branchNo) {
        this.branchNo = branchNo;
    }
}
