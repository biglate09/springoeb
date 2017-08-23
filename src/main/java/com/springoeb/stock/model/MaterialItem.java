package com.springoeb.stock.model;

import javax.persistence.*;

@Entity
public class MaterialItem {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer matItemNo;
    private String matItemName;
    private String matFlag;
    @Column(name = "mat_cat_no",insertable = true,updatable = true)
    private Integer matCatNo;

    @ManyToOne
    @JoinColumn(name = "mat_cat_no",updatable = false,insertable = false)
    private MaterialCategory materialCategory;

    @Column(name = "unit_no",insertable = true,updatable = true)
    private Integer unitNo;

    @ManyToOne
    @JoinColumn(name = "unit_no",updatable = false,insertable = false)
    private MaterialCategory unit;

    public Integer getMatItemNo() {
        return matItemNo;
    }

    public void setMatItemNo(Integer matItemNo) {
        this.matItemNo = matItemNo;
    }

    public String getMatItemName() {
        return matItemName;
    }

    public void setMatItemName(String matItemName) {
        this.matItemName = matItemName;
    }

    public Integer getMatCatNo() {
        return matCatNo;
    }

    public void setMatCatNo(Integer matCatNo) {
        this.matCatNo = matCatNo;
    }

    public MaterialCategory getMaterialCategory() {
        return materialCategory;
    }

    public void setMaterialCategory(MaterialCategory materialCategory) {
        this.materialCategory = materialCategory;
    }

    public String getMatFlag() {
        return matFlag;
    }

    public void setMatFlag(String matFlag) {
        this.matFlag = matFlag;
    }

    public Integer getUnitNo() {
        return unitNo;
    }

    public void setUnitNo(Integer unitNo) {
        this.unitNo = unitNo;
    }

    public MaterialCategory getUnit() {
        return unit;
    }

    public void setUnit(MaterialCategory unit) {
        this.unit = unit;
    }
}
