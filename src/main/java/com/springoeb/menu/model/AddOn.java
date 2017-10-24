package com.springoeb.menu.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity(name = "Addon")
public class AddOn {
    @Id
    @Column(name = "addOnNo")
    private Integer addOnNo;
    @Column(name = "menuNo")
    private Integer menuNo;
    @Column(name = "matNo")
    private Integer matNo;
    @Column(name = "qty")
    private Double qty;
    @Column(name = "price")
    private Double price;

    public Integer getAddOnNo() {
        return addOnNo;
    }

    public void setAddOnNo(Integer addOnNo) {
        this.addOnNo = addOnNo;
    }

    public Integer getMenuNo() {
        return menuNo;
    }

    public void setMenuNo(Integer menuNo) {
        this.menuNo = menuNo;
    }

    public Integer getMatNo() {
        return matNo;
    }

    public void setMatNo(Integer matNo) {
        this.matNo = matNo;
    }

    public Double getQty() {
        return qty;
    }

    public void setQty(Double qty) {
        this.qty = qty;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }
}
