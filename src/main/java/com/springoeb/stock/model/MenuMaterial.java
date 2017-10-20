package com.springoeb.stock.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.springoeb.menu.model.Menu;
import com.springoeb.stock.model_key.MenuMaterialId;

import javax.persistence.*;

@Entity(name = "Menu_Material")
@IdClass(MenuMaterialId.class)
public class MenuMaterial {
    @Id
    @Column(name="menuNo",insertable = true,updatable = true)
    private Integer menuNo;
    @Id
    @Column(name="matNo",insertable = true,updatable = true)
    private Integer matItemNo;
    @Column(name = "quantity")
    private Double quantity;

    @JsonIgnore
    @ManyToOne
    @JoinColumn(name = "menuNo",updatable = false,insertable = false)
    private Menu menu;

    @ManyToOne
    @JoinColumn(name = "matNo",updatable = false,insertable = false)
    private MaterialItem materialItem;

    public Integer getMenuNo() {
        return menuNo;
    }

    public void setMenuNo(Integer menuNo) {
        this.menuNo = menuNo;
    }

    public Integer getMatItemNo() {
        return matItemNo;
    }

    public void setMatItemNo(Integer matItemNo) {
        this.matItemNo = matItemNo;
    }

    public Double getQuantity() {
        return quantity;
    }

    public void setQuantity(Double quantity) {
        this.quantity = quantity;
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
}
