package com.springoeb.system.model;

import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.*;
import java.util.List;

@Entity
public class District {
    @Id
    private Integer districtNo;
    private String districtName;
    @Column(name = "province_no",insertable = true,updatable = true)
    private Integer provinceNo;

    @JsonIgnore
    @ManyToOne
    @JoinColumn(name = "province_no",insertable = false,updatable = false)
    private Province province;

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "district")
    private List<SubDistrict> subDistricts;

    public Integer getDistrictNo() {
        return districtNo;
    }

    public void setDistrictNo(Integer districtNo) {
        this.districtNo = districtNo;
    }

    public String getDistrictName() {
        return districtName;
    }

    public void setDistrictName(String districtName) {
        this.districtName = districtName;
    }

    public Integer getProvinceNo() {
        return provinceNo;
    }

    public void setProvinceNo(Integer provinceNo) {
        this.provinceNo = provinceNo;
    }

    public Province getProvince() {
        return province;
    }

    public void setProvince(Province province) {
        this.province = province;
    }

    public List<SubDistrict> getSubDistricts() {
        return subDistricts;
    }

    public void setSubDistricts(List<SubDistrict> subDistricts) {
        this.subDistricts = subDistricts;
    }
}
