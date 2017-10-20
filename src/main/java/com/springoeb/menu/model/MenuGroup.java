package com.springoeb.menu.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.springoeb.promotion.model.MenuGroupPromotion;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;

@Entity(name = "MenuGroup")
public class MenuGroup implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "menuGroupNo")
    private Integer menuGroupNo;
    @Column(name = "menuGroupNameTH")
    private String menuGroupNameTH;
    @Column(name = "menuGroupNameEN")
    private String menuGroupNameEN;
    @Column(name = "menuTypeNo",insertable = true,updatable = true)
    private Integer menuCatNo;
    @JsonIgnore
    @OneToMany(fetch = FetchType.LAZY, mappedBy = "menuGroup")
    private List<MenuGroupPromotion> menuGroupPromotions;

    public static final int ALL_GROUP = 0;

    @JsonIgnore
    @OneToMany(fetch = FetchType.LAZY,mappedBy = "menuGroup")
    List<Menu> menus;

    @ManyToOne
    @JoinColumn(name="menuTypeNo",insertable = false,updatable = false)
    private MenuCategory menuCategory;

    public Integer getMenuGroupNo() {
        return menuGroupNo;
    }

    public void setMenuGroupNo(Integer menuGroupNo) {
        this.menuGroupNo = menuGroupNo;
    }

    public String getMenuGroupNameTH() {
        return menuGroupNameTH;
    }

    public void setMenuGroupNameTH(String menuGroupNameTH) {
        this.menuGroupNameTH = menuGroupNameTH;
    }

    public String getMenuGroupNameEN() {
        return menuGroupNameEN;
    }

    public void setMenuGroupNameEN(String menuGroupNameEN) {
        this.menuGroupNameEN = menuGroupNameEN;
    }

    public Integer getMenuCatNo() {
        return menuCatNo;
    }

    public void setMenuCatNo(Integer menuCatNo) {
        this.menuCatNo = menuCatNo;
    }

    public List<Menu> getMenus() {
        return menus;
    }

    public void setMenus(List<Menu> menus) {
        this.menus = menus;
    }

    public MenuCategory getMenuCategory() {
        return menuCategory;
    }

    public void setMenuCategory(MenuCategory menuCategory) {
        this.menuCategory = menuCategory;
    }

    public List<MenuGroupPromotion> getMenuGroupPromotions() {
        return menuGroupPromotions;
    }

    public void setMenuGroupPromotions(List<MenuGroupPromotion> menuGroupPromotions) {
        this.menuGroupPromotions = menuGroupPromotions;
    }

    @Override
    public boolean equals(Object obj_menuGroup) {
        MenuGroup menuGroup = (MenuGroup)obj_menuGroup;
        return menuGroupNameTH.equals(menuGroup.getMenuGroupNameTH()) && menuGroupNameEN.equals(menuGroup.getMenuGroupNameEN()) && menuGroupNo.equals(menuGroup.getMenuGroupNo());
    }
}
