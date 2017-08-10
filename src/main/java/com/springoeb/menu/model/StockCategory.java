package com.springoeb.menu.model;

import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;

@Entity
public class StockCategory implements Serializable {
    @Id
    private Integer stockCatNo;
    private String stockCatName;

    @JsonIgnore
    @OneToMany(fetch = FetchType.LAZY,mappedBy = "stockCategory")
    List<MenuCategory> menuCategories;

    public Integer getStockCatNo() {
        return stockCatNo;
    }

    public void setStockCatNo(Integer stockCatNo) {
        this.stockCatNo = stockCatNo;
    }

    public String getStockCatName() {
        return stockCatName;
    }

    public void setStockCatName(String stockCatName) {
        this.stockCatName = stockCatName;
    }

    public List<MenuCategory> getMenuCategories() {
        return menuCategories;
    }

    public void setMenuCategories(List<MenuCategory> menuCategories) {
        this.menuCategories = menuCategories;
    }

}
