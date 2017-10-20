package com.springoeb.system.model;

import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.*;
import java.util.List;

@Entity(name = "SubDistrict")
public class SubDistrict {
    @Id
    @Column(name = "subDistrictNo")
    private Integer subDistrictNo;
    @Column(name = "subDistrictName")
    private String subDistrictName;
    @Column(name = "provinceNo")
    private Integer provinceNo;

    @Column(name = "districtNo",insertable = true,updatable = true)
    private Integer districtNo;

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "subDistrict")
    private List<Zipcode> zipcodes;

    @JsonIgnore
    @ManyToOne
    @JoinColumn(name = "districtNo",insertable = false,updatable = false)
    private District district;

    public Integer getSubDistrictNo() {
        return subDistrictNo;
    }

    public void setSubDistrictNo(Integer subDistrictNo) {
        this.subDistrictNo = subDistrictNo;
    }

    public String getSubDistrictName() {
        return subDistrictName;
    }

    public void setSubDistrictName(String subDistrictName) {
        this.subDistrictName = subDistrictName;
    }

    public Integer getDistrictNo() {
        return districtNo;
    }

    public void setDistrictNo(Integer districtNo) {
        this.districtNo = districtNo;
    }

    public Integer getProvinceNo() {
        return provinceNo;
    }

    public void setProvinceNo(Integer provinceNo) {
        this.provinceNo = provinceNo;
    }

    public District getDistrict() {
        return district;
    }

    public void setDistrict(District district) {
        this.district = district;
    }

    public List<Zipcode> getZipcodes() {
        return zipcodes;
    }

    public void setZipcodes(List<Zipcode> zipcodes) {
        this.zipcodes = zipcodes;
    }
}
