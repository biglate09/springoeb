package com.springoeb.menu.model;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;

@Entity
public class StockCategory implements Serializable {
    @Id
    private Integer stockCatNo;
    @Column(name = "stock_cat_name_th")
    private String stockCatNameTH;
    @Column(name = "stock_cat_name_en")
    private String stockCatNameEN;

    @OneToMany(fetch = FetchType.LAZY,mappedBy = "stockCategory")
    List<MenuCategory> menuCategories;

    public Integer getStockCatNo() {
        return stockCatNo;
    }

    public void setStockCatNo(Integer stockCatNo) {
        this.stockCatNo = stockCatNo;
    }

    public String getStockCatNameTH() {
        return stockCatNameTH;
    }

    public void setStockCatNameTH(String stockCatNameTH) {
        this.stockCatNameTH = stockCatNameTH;
    }

    public String getStockCatNameEN() {
        return stockCatNameEN;
    }

    public void setStockCatNameEN(String stockCatNameEN) {
        this.stockCatNameEN = stockCatNameEN;
    }

    public List<MenuCategory> getMenuCategories() {
        return menuCategories;
    }

    public void setMenuCategories(List<MenuCategory> menuCategories) {
        this.menuCategories = menuCategories;
    }
}
