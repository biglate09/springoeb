package com.springoeb.menu.model_key;

import java.io.Serializable;

public class MenuSetMenuId implements Serializable {
    private Integer menuSetNo;
    private Integer menuNo;

    public Integer getMenuSetNo() {
        return menuSetNo;
    }

    public void setMenuSetNo(Integer menuSetNo) {
        this.menuSetNo = menuSetNo;
    }

    public Integer getMenuNo() {
        return menuNo;
    }

    public void setMenuNo(Integer menuNo) {
        this.menuNo = menuNo;
    }
}
