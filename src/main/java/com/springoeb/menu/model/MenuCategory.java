package com.springoeb.menu.model;

import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;

@Entity(name = "MenuType")
public class MenuCategory implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "menuTypeNo")
    private Integer menuCatNo;
    @Column(name = "menuTypeName")
    private String menuCatName;
    @Column(name = "restNo")
    private Integer restNo;
    @JsonIgnore
    @OneToMany(fetch = FetchType.LAZY,mappedBy = "menuCategory")
    List<MenuGroup> menuGroups;

    public Integer getMenuCatNo() {
        return menuCatNo;
    }

    public void setMenuCatNo(Integer menuCatNo) {
        this.menuCatNo = menuCatNo;
    }

    public String getMenuCatName() {
        return menuCatName;
    }

    public void setMenuCatName(String menuCatName) {
        this.menuCatName = menuCatName;
    }

    public List<MenuGroup> getMenuGroups() {
        return menuGroups;
    }

    public void setMenuGroups(List<MenuGroup> menuGroups) {
        this.menuGroups = menuGroups;
    }

    public Integer getRestNo() {
        return restNo;
    }

    public void setRestNo(Integer restNo) {
        this.restNo = restNo;
    }
}
