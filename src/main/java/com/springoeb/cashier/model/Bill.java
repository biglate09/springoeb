package com.springoeb.cashier.model;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.springoeb.table.model.Table;

import javax.persistence.*;
import java.sql.Date;
import java.sql.Time;
import java.util.List;

@Entity(name = "Bill")
public class Bill {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "billNo")
    private Integer billNo;
    @Column(name = "totalAmount")
    private Double totalAmount;
    @Column(name = "billDate")
    private Date billDate;
    @Column(name = "billTime")
    private Time billTime;
    @Column(name = "billStatus")
    private String status;
    @Column(name = "tableNo",updatable = true,insertable = true)
    private Integer tableNo;
    @Column(name = "promotionNo")
    private Integer promotionNo;
    @ManyToOne
    @JoinColumn(name = "tableNo",updatable = false,insertable = false)
    private Table table;
    @OneToMany(fetch = FetchType.LAZY, mappedBy = "bill")
    @JsonIgnoreProperties("bill")
    private List<Order> orders;

    public static String PAID = "paid";
    public static String UNPAID = "unpaid";

    public Integer getBillNo() {
        return billNo;
    }

    public void setBillNo(Integer billNo) {
        this.billNo = billNo;
    }

    public Double getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(Double totalAmount) {
        this.totalAmount = totalAmount;
    }

    public Date getBillDate() {
        return billDate;
    }

    public void setBillDate(Date billDate) {
        this.billDate = billDate;
    }

    public Time getBillTime() {
        return billTime;
    }

    public void setBillTime(Time billTime) {
        this.billTime = billTime;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Integer getTableNo() {
        return tableNo;
    }

    public void setTableNo(Integer tableNo) {
        this.tableNo = tableNo;
    }

    public Table getTable() {
        return table;
    }

    public void setTable(Table table) {
        this.table = table;
    }

    public List<Order> getOrders() {
        return orders;
    }

    public void setOrders(List<Order> orders) {
        this.orders = orders;
    }

    public Integer getPromotionNo() {
        return promotionNo;
    }

    public void setPromotionNo(Integer promotionNo) {
        this.promotionNo = promotionNo;
    }
}
