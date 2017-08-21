package com.springoeb.menu.model;

import javax.persistence.*;
import java.io.Serializable;

@Entity
public class Menu implements Serializable{
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer menuNo;
    @Column(name = "menu_name_TH")
    private String menuNameTH;
    @Column(name = "menu_name_EN")
    private String menuNameEN;
    private String menuDesc;
    private Double menuPrice;
    private String menuPicPath;
    private Boolean available;

    @Column(name = "menu_group_no",insertable = true,updatable = true)
    private Integer menuGroupNo;

    @ManyToOne
    @JoinColumn(name = "menu_group_no",updatable = false,insertable = false)
    private MenuGroup menuGroup;

    public Integer getMenuNo() {
        return menuNo;
    }

    public void setMenuNo(Integer menuNo) {
        this.menuNo = menuNo;
    }

    public String getMenuNameTH() {
        return menuNameTH;
    }

    public void setMenuNameTH(String menuNameTH) {
        this.menuNameTH = menuNameTH;
    }

    public String getMenuNameEN() {
        return menuNameEN;
    }

    public void setMenuNameEN(String menuNameEN) {
        this.menuNameEN = menuNameEN;
    }

    public String getMenuDesc() {
        return menuDesc;
    }

    public void setMenuDesc(String menuDesc) {
        this.menuDesc = menuDesc;
    }

    public Double getMenuPrice() {
        return menuPrice;
    }

    public void setMenuPrice(Double menuPrice) {
        this.menuPrice = menuPrice;
    }

    public String getMenuPicPath() {
        return menuPicPath;
    }

    public void setMenuPicPath(String menuPicPath) {
        this.menuPicPath = menuPicPath;
    }

    public Boolean getAvailable() {
        return available;
    }

    public void setAvailable(Boolean available) {
        this.available = available;
    }

    public Integer getMenuGroupNo() {
        return menuGroupNo;
    }

    public void setMenuGroupNo(Integer menuGroupNo) {
        this.menuGroupNo = menuGroupNo;
    }

    public MenuGroup getMenuGroup() {
        return menuGroup;
    }

    public void setMenuGroup(MenuGroup menuGroup) {
        this.menuGroup = menuGroup;
    }
}
