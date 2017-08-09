package com.springoeb.menu.model;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;

@Entity
public class MenuCategory implements Serializable {
    @Id
    private Integer menuCatNo;
    @Column(name = "menu_cat_name_TH")
    private String menuCatNameTH;
    @Column(name = "menu_cat_name_EN")
    private String menuCatNameEN;
    @Column(name = "stock_cat_no",insertable = true,updatable = true)
    private Integer stockCatNo;

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "menuCategory")
    private List<Menu> menus;

    @ManyToOne
    @JoinColumn(name="stock_cat_no",insertable = false,updatable = false)
    private StockCategory stockCategory;

    public Integer getMenuCatNo() {
        return menuCatNo;
    }

    public void setMenuCatNo(Integer menuCatNo) {
        this.menuCatNo = menuCatNo;
    }

    public String getMenuCatNameTH() {
        return menuCatNameTH;
    }

    public void setMenuCatNameTH(String menuCatNameTH) {
        this.menuCatNameTH = menuCatNameTH;
    }

    public String getMenuCatNameEN() {
        return menuCatNameEN;
    }

    public void setMenuCatNameEN(String menuCatNameEN) {
        this.menuCatNameEN = menuCatNameEN;
    }

    public Integer getStockCatNo() {
        return stockCatNo;
    }

    public void setStockCatNo(Integer stockCatNo) {
        this.stockCatNo = stockCatNo;
    }

    public List<Menu> getMenus() {
        return menus;
    }

    public void setMenus(List<Menu> menus) {
        this.menus = menus;
    }

    public StockCategory getStockCategory() {
        return stockCategory;
    }

    public void setStockCategory(StockCategory stockCategory) {
        this.stockCategory = stockCategory;
    }
}
