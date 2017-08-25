package com.springoeb.stock.model;

import javax.persistence.*;
import java.sql.Date;

@Entity
public class MaterialHistory {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer matHistNo;
    private String matName;
    private Double matQuantity;
    private Date datetime;
    @Column(name = "mat_item_no",insertable = true,updatable = true)
    private Integer matItemNo;
    @Column(name = "branch_no",insertable = true,updatable = true)
    private Integer branchNo;

    @ManyToOne
    @JoinColumn(name = "mat_item_no",updatable = false,insertable = false)
    private MaterialItem materialItem;

    public Integer getMatHistNo() {
        return matHistNo;
    }

    public void setMatHistNo(Integer matHistNo) {
        this.matHistNo = matHistNo;
    }

    public String getMatName() {
        return matName;
    }

    public void setMatName(String matName) {
        this.matName = matName;
    }

    public Double getMatQuantity() {
        return matQuantity;
    }

    public void setMatQuantity(Double matQuantity) {
        this.matQuantity = matQuantity;
    }

    public Date getDatetime() {
        return datetime;
    }

    public void setDatetime(Date datetime) {
        this.datetime = datetime;
    }

    public Integer getMatItemNo() {
        return matItemNo;
    }

    public void setMatItemNo(Integer matItemNo) {
        this.matItemNo = matItemNo;
    }

    public Integer getBranchNo() {
        return branchNo;
    }

    public void setBranchNo(Integer branchNo) {
        this.branchNo = branchNo;
    }

    public MaterialItem getMaterialItem() {
        return materialItem;
    }

    public void setMaterialItem(MaterialItem materialItem) {
        this.materialItem = materialItem;
    }
}
