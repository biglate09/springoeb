package com.springoeb.system.model;

import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.*;

@Entity
public class Zipcode {
    @Id
    private String zipcodeNo;
    private Integer provinceNo;
    private Integer districtNo;
    @Column(name = "zipcode")
    private String zipcodeName;

    @Column(name = "sub_district_no",insertable = true,updatable = true)
    private Integer subDistrictNo;

    @JsonIgnore
    @ManyToOne
    @JoinColumn(name = "sub_district_no",insertable = false,updatable = false)
    private SubDistrict subDistrict;


    public String getZipcodeNo() {
        return zipcodeNo;
    }

    public void setZipcodeNo(String zipcodeNo) {
        this.zipcodeNo = zipcodeNo;
    }

    public Integer getProvinceNo() {
        return provinceNo;
    }

    public void setProvinceNo(Integer provinceNo) {
        this.provinceNo = provinceNo;
    }

    public Integer getDistrictNo() {
        return districtNo;
    }

    public void setDistrictNo(Integer districtNo) {
        this.districtNo = districtNo;
    }

    public String getZipcodeName() {
        return zipcodeName;
    }

    public void setZipcodeName(String zipcodeName) {
        this.zipcodeName = zipcodeName;
    }

    public Integer getSubDistrictNo() {
        return subDistrictNo;
    }

    public void setSubDistrictNo(Integer subDistrictNo) {
        this.subDistrictNo = subDistrictNo;
    }

    public SubDistrict getSubDistrict() {
        return subDistrict;
    }

    public void setSubDistrict(SubDistrict subDistrict) {
        this.subDistrict = subDistrict;
    }
}
