package com.springoeb.kitchen.model;

import com.springoeb.cashier.model.OrderAddOn;
import com.springoeb.menu.model.Menu;

import java.util.List;

public class QueueBean {
    private List<OrderAddOn> addOns;
    private Menu menu;
    private String status;

    public List<OrderAddOn> getAddOns() {
        return addOns;
    }

    public void setAddOns(List<OrderAddOn> addOns) {
        this.addOns = addOns;
    }

    public Menu getMenu() {
        return menu;
    }

    public void setMenu(Menu menu) {
        this.menu = menu;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public boolean equals(Object obj) {
        boolean eq = false;
        QueueBean qb = (QueueBean) obj;
        if(menu.getMenuNo() == qb.getMenu().getMenuNo() && addOns.containsAll(qb.getAddOns()) && addOns.size() == qb.getAddOns().size() && status.equals(qb.getStatus())){
            eq = true;
        }
        return eq;
    }

    @Override
    public int hashCode() {
        return 1;
    }

    @Override
    public String toString() {
        return "QueueBean{" +
                "addOns=" + addOns +
                ", menu=" + menu.getMenuNameTH() +
                ", status='" + status + '\'' +
                '}';
    }
}
