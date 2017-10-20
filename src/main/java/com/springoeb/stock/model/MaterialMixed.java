package com.springoeb.stock.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.springoeb.stock.model_key.MaterialMixedId;

import javax.persistence.*;

@Entity(name = "MaterialMixed")
@IdClass(MaterialMixedId.class)

public class MaterialMixed {
    @Id
    @Column(name="mixedProdNo",insertable = true,updatable = true)
    private Integer mixedProdNo;
    @Id
    @Column(name="itemNo",insertable = true,updatable = true)
    private Integer itemNo;
    @Column(name = "quantity")
    private Double quantity;

    @JsonIgnore
    @ManyToOne
    @JoinColumn(name = "mixedProdNo",updatable = false,insertable = false)
    private MaterialItem mixedProduct;

    @ManyToOne
    @JoinColumn(name = "itemNo",updatable = false,insertable = false)
    private MaterialItem materialItem;

    public Integer getMixedProdNo() {
        return mixedProdNo;
    }

    public void setMixedProdNo(Integer mixedProdNo) {
        this.mixedProdNo = mixedProdNo;
    }

    public Integer getItemNo() {
        return itemNo;
    }

    public void setItemNo(Integer itemNo) {
        this.itemNo = itemNo;
    }

    public Double getQuantity() {
        return quantity;
    }

    public void setQuantity(Double quantity) {
        this.quantity = quantity;
    }

    public MaterialItem getMixedProduct() {
        return mixedProduct;
    }

    public void setMixedProduct(MaterialItem mixedProduct) {
        this.mixedProduct = mixedProduct;
    }

    public MaterialItem getMaterialItem() {
        return materialItem;
    }

    public void setMaterialItem(MaterialItem materialItem) {
        this.materialItem = materialItem;
    }
}
