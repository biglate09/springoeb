package com.springoeb.menu.model;

import com.springoeb.menu.model_key.MenuSetMenuId;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@IdClass(MenuSetMenuId.class)
public class MenuSetMenu implements Serializable {
    @Id
    @Column(name="menu_set_no",insertable = true,updatable = true)
    private Integer menuSetNo;
    @Id
    @Column(name="menu_no",insertable =true,updatable = true)
    private Integer menuNo;

    @ManyToOne
    @JoinColumn(name="menu_set_no",insertable = false,updatable = false)
    private MenuSet menuSet;

    @ManyToOne
    @JoinColumn(name="menu_no",insertable = false,updatable = false)
    private Menu menu;

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

    public MenuSet getMenuSet() {
        return menuSet;
    }

    public void setMenuSet(MenuSet menuSet) {
        this.menuSet = menuSet;
    }

    public Menu getMenu() {
        return menu;
    }

    public void setMenu(Menu menu) {
        this.menu = menu;
    }
}
