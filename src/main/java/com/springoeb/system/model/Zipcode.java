package com.springoeb.system.model;

import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.*;

@Entity(name = "Zipcode")
public class Zipcode {
    @Id
    @Column(name = "zipcodeNo")
    private String zipcodeNo;
    @Column(name = "provinceNo")
    private Integer provinceNo;
    @Column(name = "districtNo")
    private Integer districtNo;
    @Column(name = "zipcode")
    private String zipcodeName;

    @Column(name = "subDistrictNo",insertable = true,updatable = true)
    private Integer subDistrictNo;

    @JsonIgnore
    @ManyToOne
    @JoinColumn(name = "subDistrictNo",insertable = false,updatable = false)
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
