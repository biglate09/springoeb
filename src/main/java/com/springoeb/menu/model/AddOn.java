package com.springoeb.menu.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.springoeb.stock.model.MaterialItem;

import javax.persistence.*;

@Entity(name = "Addon")
public class AddOn {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "addOnNo")
    private Integer addOnNo;
    @Column(name = "menuNo",updatable = true,insertable = true)
    private Integer menuNo;
    @Column(name = "matNo")
    private Integer matNo;
    @Column(name = "qty")
    private Double qty;
    @Column(name = "price")
    private Double price;
    @ManyToOne
    @JsonIgnore
    @JoinColumn(name = "menuNo",updatable = false,insertable = false)
    private Menu menu;
    @ManyToOne
    @JoinColumn(name = "matNo",updatable = false,insertable = false)
    private MaterialItem materialItem;

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

    public Menu getMenu() {
        return menu;
    }

    public void setMenu(Menu menu) {
        this.menu = menu;
    }

    public MaterialItem getMaterialItem() {
        return materialItem;
    }

    public void setMaterialItem(MaterialItem materialItem) {
        this.materialItem = materialItem;
    }

    @Override
    public boolean equals(Object obj) {
        boolean eq = false;
        AddOn ao = (AddOn)obj;
        if(addOnNo == ao.getAddOnNo()){
            eq = true;
        }
        return eq;
    }
}
