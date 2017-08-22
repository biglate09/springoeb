package com.springoeb.menu.model_key;

import java.io.Serializable;

public class BranchMenuId implements Serializable {
    private Integer branchNo;
    private Integer menuNo;

    public Integer getBranchNo() {
        return branchNo;
    }

    public void setBranchNo(Integer branchNo) {
        this.branchNo = branchNo;
    }

    public Integer getMenuNo() {
        return menuNo;
    }

    public void setMenuNo(Integer menuNo) {
        this.menuNo = menuNo;
    }
}
