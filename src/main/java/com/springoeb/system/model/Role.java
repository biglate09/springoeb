package com.springoeb.system.model;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Role {
    @Id
    private Integer roleNo;
    private String roleName;
    private boolean canAdd;

    public static Integer MANAGER = 1;
    public static Integer EMPLOYEE = 2;
    public static Integer KITCHEN = 3;
    public static Integer CASHIER = 4;

    public Integer getRoleNo() {
        return roleNo;
    }

    public void setRoleNo(Integer roleNo) {
        this.roleNo = roleNo;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    public boolean isCanAdd() {
        return canAdd;
    }

    public void setCanAdd(boolean canAdd) {
        this.canAdd = canAdd;
    }
}
