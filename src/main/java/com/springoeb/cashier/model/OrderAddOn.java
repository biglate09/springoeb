package com.springoeb.cashier.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.springoeb.cashier.model_key.OrderAddOnId;
import com.springoeb.menu.model.AddOn;

import javax.persistence.*;

@Entity(name = "Order_Addon")
@IdClass(OrderAddOnId.class)
public class OrderAddOn {
    @Id
    @Column(name = "orderNo")
    private Integer orderNo;
    @Id
    @Column(name = "addOnNo",updatable = true,insertable = true)
    private Integer addOnNo;

    @JsonIgnore
    @ManyToOne
    @JoinColumn(name = "orderNo",updatable = false,insertable = false)
    private Order order;

    @ManyToOne
    @JoinColumn(name = "addOnNo",updatable = false,insertable = false)
    private AddOn addOn;

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

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }

    public AddOn getAddOn() {
        return addOn;
    }

    public void setAddOn(AddOn addOn) {
        this.addOn = addOn;
    }

    @Override
    public boolean equals(Object obj) {
        boolean eq = false;
        OrderAddOn oa = (OrderAddOn)obj;

        if(oa.getAddOnNo() == addOnNo){
            eq = true;
        }

        return eq;
    }

    @Override
    public int hashCode() {
        return 1;
    }
}
