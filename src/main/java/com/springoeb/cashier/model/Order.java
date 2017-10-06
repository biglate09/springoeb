package com.springoeb.cashier.model;

import com.springoeb.menu.model.Menu;

import javax.persistence.*;

@Entity(name = "customer_order")
public class Order {
    @Id
    private Integer orderNo;
    private Integer quantity;
    private Double amount;
    private String status;
    @Column(name = "bill_no",updatable = true,insertable = true)
    private Integer billNo;
    @Column(name = "menu_no",updatable = true,insertable = true)
    private Integer menuNo;
    @ManyToOne
    @JoinColumn(name = "bill_no",updatable = false,insertable = false)
    private Bill bill;
    @ManyToOne
    @JoinColumn(name = "menu_no",updatable = false,insertable = false)
    private Menu menu;

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

    public Bill getBill() {
        return bill;
    }

    public void setBill(Bill bill) {
        this.bill = bill;
    }

    public Menu getMenu() {
        return menu;
    }

    public void setMenu(Menu menu) {
        this.menu = menu;
    }
}
