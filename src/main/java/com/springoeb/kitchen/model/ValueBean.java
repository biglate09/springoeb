package com.springoeb.kitchen.model;

import com.springoeb.table.model.Table;

public class ValueBean {
    private Table table;
    private Integer qty;
    private Integer orderNo;

    public Table getTable() {
        return table;
    }

    public void setTable(Table table) {
        this.table = table;
    }

    public Integer getQty() {
        return qty;
    }

    public void setQty(Integer qty) {
        this.qty = qty;
    }

    public Integer getOrderNo() {
        return orderNo;
    }

    public void setOrderNo(Integer orderNo) {
        this.orderNo = orderNo;
    }

    @Override
    public String toString() {
        return "ValueBean{" +
                "table=" + table.getTableName() +
                '}';
    }
}
