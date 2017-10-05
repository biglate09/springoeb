package com.springoeb.cashier.model;

import javax.persistence.*;

@Entity(name = "customer_order")
public class Order {
    @Id
    private Integer orderNo;
    private Integer quantity;
    private Double amount;
    private String status;
    private Integer menuNo;
    @Column(name = "bill_no",updatable = true,insertable = true)
    private Integer billNo;
    @ManyToOne
    @JoinColumn(name = "bill_no",updatable = false,insertable = false)
    private Bill bill;

    public static String RESERVED = "reserved";
    public static String WAITING = "waiting";
    public static String COOKING = "cooking";
    public static String SERVED = "served";
    public static String CANCELLED = "cancelled";

    public Integer getOrderNo() {
        return orderNo;
    }

    public void setOrderNo(Integer orderNo) {
        this.orderNo = orderNo;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public Double getAmount() {
        return amount;
    }

    public void setAmount(Double amount) {
        this.amount = amount;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Integer getMenuNo() {
        return menuNo;
    }

    public void setMenuNo(Integer menuNo) {
        this.menuNo = menuNo;
    }

    public Integer getBillNo() {
        return billNo;
    }

    public void setBillNo(Integer billNo) {
        this.billNo = billNo;
    }
}
