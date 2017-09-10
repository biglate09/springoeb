package com.springoeb.table.model;

import javax.persistence.*;

@Entity(name = "customer_table")
public class Table {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer tableNo;
    private String tableName;
    private Double seatAmount;
    private boolean isAvailable;
    private Integer branchNo;

    public Integer getTableNo() {
        return tableNo;
    }

    public void setTableNo(Integer tableNo) {
        this.tableNo = tableNo;
    }

    public String getTableName() {
        return tableName;
    }

    public void setTableName(String tableName) {
        this.tableName = tableName;
    }

    public Double getSeatAmount() {
        return seatAmount;
    }

    public void setSeatAmount(Double seatAmount) {
        this.seatAmount = seatAmount;
    }

    public boolean isAvailable() {
        return isAvailable;
    }

    public void setAvailable(boolean available) {
        isAvailable = available;
    }

    public Integer getBranchNo() {
        return branchNo;
    }

    public void setBranchNo(Integer branchNo) {
        this.branchNo = branchNo;
    }
}
