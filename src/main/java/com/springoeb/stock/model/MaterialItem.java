package com.springoeb.stock.model;

import javax.persistence.*;

@Entity
public class MaterialItem {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer matItemNo;
    private String matItemName;

    @Column(name = "mat_cat_no",insertable = true,updatable = true)
    private Integer matCatNo;

    @ManyToOne
    @JoinColumn(name = "mat_cat_no",updatable = false,insertable = false)
    private MaterialCategory materialCategory;

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
}
