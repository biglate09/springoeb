package com.springoeb.system.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity(name = "Role")
public class Role {
    @Id
    @Column(name = "roleNo")
    private Integer roleNo;
    @Column(name = "roleName")
    private String roleName;
    @Column(name = "canAdd")
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
