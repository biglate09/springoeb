package com.springoeb.cashier.model;

import com.springoeb.table.model.Table;

import javax.persistence.*;
import java.sql.Date;
import java.sql.Time;

@Entity(name = "bill")
public class Bill {
    @Id
    private Integer billNo;
    private Double totalAmount;
    private Date billDate;
    private Time billTime;
    private String status;
    @Column(name = "table_no",updatable = true,insertable = true)
    private Integer tableNo;
    @ManyToOne
    @JoinColumn(name = "table_no",updatable = false,insertable = false)
    private Table table;

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
}
