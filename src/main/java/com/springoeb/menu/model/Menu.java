package com.springoeb.menu.model;

import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;

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
    private String menuFlag;
    private Integer localFlag;
    @JsonIgnore
    @OneToMany(fetch = FetchType.LAZY, mappedBy = "menu")
    private List<BranchMenu> branchMenu;

    @Column(name = "menu_group_no",insertable = true,updatable = true)
    private Integer menuGroupNo;

    @ManyToOne
    @JoinColumn(name = "menu_group_no",updatable = false,insertable = false)
    private MenuGroup menuGroup;

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "menuSet")
    private List<MenuInSet> menuInSets;

    public static final String flagForMenu = "M";
    public static final String flagForMenuSet = "S";
    public static final int OFFICIAL_MENU_FLAG = 0;

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

    public String getMenuFlag() {
        return menuFlag;
    }

    public void setMenuFlag(String menuFlag) {
        this.menuFlag = menuFlag;
    }

    public int getLocalFlag() {
        return localFlag;
    }

    public void setLocalFlag(int localFlag) {
        this.localFlag = localFlag;
    }

    public List<MenuInSet> getMenuInSets() {
        return menuInSets;
    }

    public void setMenuInSets(List<MenuInSet> menuInSets) {
        this.menuInSets = menuInSets;
    }

    public void setLocalFlag(Integer localFlag) {
        this.localFlag = localFlag;
    }

    public List<BranchMenu> getBranchMenu() {
        return branchMenu;
    }

    public void setBranchMenu(List<BranchMenu> branchMenu) {
        this.branchMenu = branchMenu;
    }

    @Override
    public String toString() {
        return "Menu{" +
                "menuNameTH='" + menuNameTH + '\'' +
                '}';
    }
}
