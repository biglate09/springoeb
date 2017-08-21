package com.springoeb.stock.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import java.io.Serializable;

@Entity
public class MaterialCategory implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer matCatNo;
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
