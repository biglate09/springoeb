package com.springoeb.stock.model_key;

import java.io.Serializable;

public class MaterialMixedId implements Serializable {
    private Integer mixedProdNo;
    private Integer itemNo;
    private Double quantity;

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
}
