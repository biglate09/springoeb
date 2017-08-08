package com.springoeb.menu.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import java.io.Serializable;

@Entity
public class MenuSet implements Serializable {
    @Id
    private Integer menuSetNo;
    private String menuSetNameTH;
    private String menuSetNameEN;
    private String menuSetNameDesc;
    private Double menuSetPrice;
    private String menuSetPicPath;
    private Boolean isOfficialMenuSet;

    public Integer getMenuSetNo() {
        return menuSetNo;
    }

    public void setMenuSetNo(Integer menuSetNo) {
        this.menuSetNo = menuSetNo;
    }

    public String getMenuSetNameTH() {
        return menuSetNameTH;
    }

    public void setMenuSetNameTH(String menuSetNameTH) {
        this.menuSetNameTH = menuSetNameTH;
    }

    public String getMenuSetNameEN() {
        return menuSetNameEN;
    }

    public void setMenuSetNameEN(String menuSetNameEN) {
        this.menuSetNameEN = menuSetNameEN;
    }

    public String getMenuSetNameDesc() {
        return menuSetNameDesc;
    }

    public void setMenuSetNameDesc(String menuSetNameDesc) {
        this.menuSetNameDesc = menuSetNameDesc;
    }

    public Double getMenuSetPrice() {
        return menuSetPrice;
    }

    public void setMenuSetPrice(Double menuSetPrice) {
        this.menuSetPrice = menuSetPrice;
    }

    public String getMenuSetPicPath() {
        return menuSetPicPath;
    }

    public void setMenuSetPicPath(String menuSetPicPath) {
        this.menuSetPicPath = menuSetPicPath;
    }

    public Boolean getOfficialMenuSet() {
        return isOfficialMenuSet;
    }

    public void setOfficialMenuSet(Boolean officialMenuSet) {
        isOfficialMenuSet = officialMenuSet;
    }
}
