package com.springoeb.menu.model_key;

import java.io.Serializable;

public class MenuInSetId implements Serializable {
    private Integer menuNo;
    private Integer menuSubNo;

    public Integer getMenuNo() {
        return menuNo;
    }

    public void setMenuNo(Integer menuNo) {
        this.menuNo = menuNo;
    }

    public Integer getMenuSubNo() {
        return menuSubNo;
    }

    public void setMenuSubNo(Integer menuSubNo) {
        this.menuSubNo = menuSubNo;
    }
}
