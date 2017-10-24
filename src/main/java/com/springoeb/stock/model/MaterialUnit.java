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
    @Column(name = "restNo")
    private Integer restNo;

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

    public Integer getRestNo() {
        return restNo;
    }

    public void setRestNo(Integer restNo) {
        this.restNo = restNo;
    }
}
