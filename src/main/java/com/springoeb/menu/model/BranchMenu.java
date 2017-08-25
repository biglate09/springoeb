package com.springoeb.menu.model;

import com.springoeb.menu.model_key.BranchMenuId;

import javax.persistence.*;

@Entity
@IdClass(BranchMenuId.class)
public class BranchMenu {
    @Id
    @Column(name="branch_no",insertable = true,updatable = true)
    private Integer branchNo;
    @Id
    @Column(name="menu_no",insertable = true,updatable = true)
    private Integer menuNo;
    private boolean available;

    @ManyToOne
    @JoinColumn(name = "menu_no",updatable = false,insertable = false)
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

    @Override
    public boolean equals(Object obj) {
        BranchMenu paramBranchMenu = (BranchMenu)obj;
        if(paramBranchMenu.getMenuNo() == menuNo){
            return true;
        }else{
            return false;
        }
    }
}
