package com.springoeb.stock.model;

import javax.persistence.*;
import java.io.Serializable;

@Entity(name = "MaterialType")
public class MaterialCategory implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "matTypeNo")
    private Integer matCatNo;
    @Column(name = "matTypeName")
    private String matCatName;

    public Integer getMatCatNo() {
        return matCatNo;
    }

    public void setMatCatNo(Integer matCatNo) {
        this.matCatNo = matCatNo;
    }

    public String getMatCatName() {
        return matCatName;
    }

    public void setMatCatName(String matCatName) {
        this.matCatName = matCatName;
    }
}
