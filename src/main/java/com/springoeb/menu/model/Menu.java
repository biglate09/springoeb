package com.springoeb.menu.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.springoeb.cashier.model.Order;
import com.springoeb.stock.model.MenuMaterial;

import javax.persistence.*;
import java.io.Serializable;
import java.util.*;

@Entity(name = "Menu")
public class Menu implements Serializable{
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "menuNo")
    private Integer menuNo;
    @Column(name = "menuNameTH")
    private String menuNameTH;
    @Column(name = "menuNameEN")
    private String menuNameEN;
    @Column(name = "menuDesc")
    private String menuDesc;
    @Column(name = "menuPrice")
    private Double menuPrice;
    @Column(name = "menuPicPath")
    private String menuPicPath;
    @Column(name = "menuFlag")
    private String menuFlag;
    @Column(name = "localFlag")
    private Integer localFlag;
    @Column(name = "menuGroupNo",insertable = true,updatable = true)
    private Integer menuGroupNo;
    @Column(name = "restNo",insertable = true,updatable = true)
    private Integer restNo;

    @JsonIgnore
    @OneToMany(fetch = FetchType.LAZY, mappedBy = "menu")
    private List<Order> orders;

    @JsonIgnore
    @OneToMany(fetch = FetchType.LAZY, mappedBy = "menu")
    private List<BranchMenu> branchMenu;

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "menu")
    private List<AddOn> addOns;

    @ManyToOne
    @JoinColumn(name = "menuGroupNo",updatable = false,insertable = false)
    private MenuGroup menuGroup;

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "menuSet")
    private List<MenuInSet> menuInSets;

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "menu")
    private List<MenuMaterial> menuMaterials;

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

    public List<MenuMaterial> getMenuMaterials() {
        return menuMaterials;
    }

    public void setMenuMaterials(List<MenuMaterial> menuMaterials) {
        this.menuMaterials = menuMaterials;
    }

    public Integer getRestNo() {
        return restNo;
    }

    public void setRestNo(Integer restNo) {
        this.restNo = restNo;
    }

    public List<AddOn> getAddOns() {
        return addOns;
    }

    public void setAddOns(List<AddOn> addOns) {
        this.addOns = addOns;
    }

    public List<Order> getOrders() {
        return orders;
    }

    public void setOrders(List<Order> orders) {
        this.orders = orders;
    }
}
