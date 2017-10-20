package com.springoeb.menu.model;

import com.springoeb.menu.model_key.BranchMenuId;

import javax.persistence.*;

@Entity(name = "Branch_Menu")
@IdClass(BranchMenuId.class)
public class BranchMenu {
    @Id
    @Column(name="branchNo",insertable = true,updatable = true)
    private Integer branchNo;
    @Id
    @Column(name="menuNo",insertable = true,updatable = true)
    private Integer menuNo;
    @Column(name = "isAvailable")
    private boolean available;

    @ManyToOne
    @JoinColumn(name = "menuNo",updatable = false,insertable = false)
    private Menu menu;

    public Integer getBranchNo() {
        return branchNo;
    }

    public void setBranchNo(Integer branchNo) {
        this.branchNo = branchNo;
    }

    public Integer getMenuNo() {
        return menuNo;
    }

    public void setMenuNo(Integer menuNo) {
        this.menuNo = menuNo;
    }

    public boolean isAvailable() {
        return available;
    }

    public void setAvailable(boolean available) {
        this.available = available;
    }

    public Menu getMenu() {
        return menu;
    }

    public void setMenu(Menu menu) {
        this.menu = menu;
    }
}
