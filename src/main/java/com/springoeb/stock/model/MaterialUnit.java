package com.springoeb.stock.model;

import javax.persistence.*;

@Entity(name = "MaterialUnit")
public class MaterialUnit {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "unitNo")
    private Integer unitNo;
    @Column(name = "unitName")
    private String unitName;

    public Integer getUnitNo() {
        return unitNo;
    }

    public void setUnitNo(Integer unitNo) {
        this.unitNo = unitNo;
    }

    public String getUnitName() {
        return unitName;
    }

    public void setUnitName(String unitName) {
        this.unitName = unitName;
    }
}
