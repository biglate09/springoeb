package com.springoeb.menu.model;

import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;

@Entity
public class MenuGroup implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer menuGroupNo;
    @Column(name = "menu_group_name_TH")
    private String menuGroupNameTH;
    @Column(name = "menu_group_name_EN")
    private String menuGroupNameEN;
    @Column(name = "menu_cat_no",insertable = true,updatable = true)
    private Integer menuCatNo;

    @JsonIgnore
    @OneToMany(fetch = FetchType.LAZY,mappedBy = "menuGroup")
    List<Menu> menus;

    @ManyToOne
    @JoinColumn(name="menu_cat_no",insertable = false,updatable = false)
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

    @Override
    public boolean equals(Object obj_menuGroup) {
        MenuGroup menuGroup = (MenuGroup)obj_menuGroup;
        return menuGroupNameTH.equals(menuGroup.getMenuGroupNameTH()) && menuGroupNameEN.equals(menuGroup.getMenuGroupNameEN()) && menuGroupNo.equals(menuGroup.getMenuGroupNo());
    }
}
