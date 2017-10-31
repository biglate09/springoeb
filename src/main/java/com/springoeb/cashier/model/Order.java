package com.springoeb.cashier.model;

import com.springoeb.menu.model.Menu;

import javax.persistence.*;
import java.sql.Date;
import java.sql.Time;

@Entity(name = "CustomerOrder")
public class Order {
    @Id
    @Column(name = "orderNo")
    private Integer orderNo;
    @Column(name = "quantity")
    private Integer quantity;
    @Column(name = "amount")
    private Double amount;
    @Column(name = "orderStatus")
    private String status;
    @Column(name = "date")
    private Date date;
    @Column(name = "time")
    private Time time;
    @Column(name = "billNo",updatable = true,insertable = true)
    private Integer billNo;
    @Column(name = "menuNo",updatable = true,insertable = true)
    private Integer menuNo;
    @ManyToOne
    @JoinColumn(name = "billNo",updatable = false,insertable = false)
    private Bill bill;
    @ManyToOne
    @JoinColumn(name = "menuNo",updatable = false,insertable = false)
    private Menu menu;

    public static String RESERVED = "reserved";
    public static String WAITING = "waiting";
    public static String COOKING = "cooking";
    public static String COOKED = "cooked";
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

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Time getTime() {
        return time;
    }

    public void setTime(Time time) {
        this.time = time;
    }

    @Override
    public String toString() {
        return "Order{" +
                menu.getMenuNameTH() + " : " + status + " โต๊ะ : " + bill.getTable().getTableName() +
                '}';
    }
}
