package com.springoeb.system.model;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Role {
    @Id
    private Integer roleNo;
    private Integer roleName;

    public Integer getRoleNo() {
        return roleNo;
    }

    public void setRoleNo(Integer roleNo) {
        this.roleNo = roleNo;
    }

    public Integer getRoleName() {
        return roleName;
    }

    public void setRoleName(Integer roleName) {
        this.roleName = roleName;
    }
}
