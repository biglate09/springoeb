package com.springoeb.cashier.model_key;

import java.io.Serializable;

public class OrderAddOnId implements Serializable {
    private Integer orderNo;
    private Integer addOnNo;

    public Integer getOrderNo() {
        return orderNo;
    }

    public void setOrderNo(Integer orderNo) {
        this.orderNo = orderNo;
    }

    public Integer getAddOnNo() {
        return addOnNo;
    }

    public void setAddOnNo(Integer addOnNo) {
        this.addOnNo = addOnNo;
    }
}
