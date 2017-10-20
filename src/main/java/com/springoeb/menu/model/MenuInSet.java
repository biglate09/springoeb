package com.springoeb.menu.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.springoeb.menu.model_key.MenuInSetId;

import javax.persistence.*;
import java.io.Serializable;

@Entity(name = "Menu_MenuSet")
@IdClass(MenuInSetId.class)
public class MenuInSet implements Serializable {
    @Id
    @Column(name="menuSetNo",insertable = true,updatable = true)
    private Integer menuNo;
    @Id
    @Column(name="menuNo",insertable = true,updatable = true)
    private Integer menuSubNo;
    @Column(name = "amount")
    private Integer amount;

    @JsonIgnore
    @ManyToOne
    @JoinColumn(name="menuSetNo",insertable = false,updatable = false)
    private Menu menuSet;

    @ManyToOne
    @JoinColumn(name="menuNo",insertable = false,updatable = false)
    private Menu menu;

    public Integer getMenuNo() {
        return menuNo;
    }

    public void setMenuNo(Integer menuNo) {
        this.menuNo = menuNo;
    }

    public Integer getMenuSubNo() {
        return menuSubNo;
    }

    public void setMenuSubNo(Integer menuSubNo) {
        this.menuSubNo = menuSubNo;
    }

    public Integer getAmount() {
        return amount;
    }

    public void setAmount(Integer amount) {
        this.amount = amount;
    }

    public Menu getMenuSet() {
        return menuSet;
    }

    public void setMenuSet(Menu menuSet) {
        this.menuSet = menuSet;
    }

    public Menu getMenu() {
        return menu;
    }

    public void setMenu(Menu menu) {
        this.menu = menu;
    }
}
