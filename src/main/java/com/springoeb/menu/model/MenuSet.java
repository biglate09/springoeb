package com.springoeb.menu.model;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;

@Entity
public class MenuSet implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer menuSetNo;
    @Column(name = "menu_set_name_TH")
    private String menuSetNameTH;
    @Column(name = "menu_set_name_EN")
    private String menuSetNameEN;
    private String menuSetDesc;
    private Double menuSetPrice;
    private String menuSetPicPath;
    private Boolean available;

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "menuSet")
    private List<MenuSetMenu> menuSetMenus;

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

    public String getMenuSetDesc() {
        return menuSetDesc;
    }

    public void setMenuSetDesc(String menuSetDesc) {
        this.menuSetDesc = menuSetDesc;
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

    public Boolean getAvailable() {
        return available;
    }

    public void setAvailable(Boolean available) {
        this.available = available;
    }

    public List<MenuSetMenu> getMenuSetMenus() {
        return menuSetMenus;
    }

    public void setMenuSetMenus(List<MenuSetMenu> menuSetMenus) {
        this.menuSetMenus = menuSetMenus;
    }

    @Override
    public String toString() {
        return "MenuSet{" +
                "menuSetNo=" + menuSetNo +
                ", menuSetNameTH='" + menuSetNameTH + '\'' +
                ", menuSetNameEN='" + menuSetNameEN + '\'' +
                ", menuSetDesc='" + menuSetDesc + '\'' +
                ", menuSetPrice=" + menuSetPrice +
                ", menuSetPicPath='" + menuSetPicPath + '\'' +
                ", available=" + available +
                ", menuSetMenus=" + menuSetMenus +
                '}';
    }
}
