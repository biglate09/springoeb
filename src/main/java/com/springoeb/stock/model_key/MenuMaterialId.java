package com.springoeb.stock.model_key;

import java.io.Serializable;

public class MenuMaterialId implements Serializable {
    private Integer menuNo;
    private Integer matItemNo;

    public Integer getMenuNo() {
        return menuNo;
    }

    public void setMenuNo(Integer menuNo) {
        this.menuNo = menuNo;
    }

    public Integer getMatItemNo() {
        return matItemNo;
    }

    public void setMatItemNo(Integer matItemNo) {
        this.matItemNo = matItemNo;
    }

}
