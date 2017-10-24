package com.springoeb.stock.model;

import javax.persistence.*;
import java.util.List;

@Entity(name = "Material")
public class MaterialItem {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "matNo")
    private Integer matItemNo;
    @Column(name = "matName")
    private String matItemName;
    @Column(name = "matFlag")
    private String matFlag;
    @Column(name = "matQuantity")
    private Double quantity;
    @Column(name = "matTypeNo",insertable = true,updatable = true)
    private Integer matCatNo;
    @Column(name = "restNo")
    private Integer restNo;

    @ManyToOne
    @JoinColumn(name = "matTypeNo",updatable = false,insertable = false)
    private MaterialCategory materialCategory;

    @Column(name = "unitNo",insertable = true,updatable = true)
    private Integer unitNo;

    @ManyToOne
    @JoinColumn(name = "unitNo",updatable = false,insertable = false)
    private MaterialUnit unit;

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "mixedProduct")
    private List<MaterialMixed> materialItemList;

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "materialItem")
    private List<MaterialHistory> materialHistories;

    public static final String flagForItem = "I";
    public static final String flagForMixed = "M";

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

    public MaterialUnit getUnit() {
        return unit;
    }

    public void setUnit(MaterialUnit unit) {
        this.unit = unit;
    }

    public Double getQuantity() {
        return quantity;
    }

    public void setQuantity(Double quantity) {
        this.quantity = quantity;
    }

    public List<MaterialMixed> getMaterialItemList() {
        return materialItemList;
    }

    public void setMaterialItemList(List<MaterialMixed> materialItemList) {
        this.materialItemList = materialItemList;
    }

    public List<MaterialHistory> getMaterialHistories() {
        return materialHistories;
    }

    public Integer getRestNo() {
        return restNo;
    }

    public void setRestNo(Integer restNo) {
        this.restNo = restNo;
    }

    public void setMaterialHistories(List<MaterialHistory> materialHistories) {
        this.materialHistories = materialHistories;


    }
}
