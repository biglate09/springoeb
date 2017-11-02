package com.springoeb.kitchen.model;

import com.springoeb.table.model.Table;

public class ValueBean {
    private Table table;
    private Integer qty;

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
}
