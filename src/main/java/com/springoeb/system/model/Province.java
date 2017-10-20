package com.springoeb.system.model;

import javax.persistence.*;
import java.util.List;

@Entity(name = "Province")
public class Province {
    @Id
    @Column(name = "provinceNo")
    private Integer provinceNo;
    @Column(name = "provinceName")
    private String provinceName;

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "province")
    private List<District> districts;

    public Integer getProvinceNo() {
        return provinceNo;
    }

    public void setProvinceNo(Integer provinceNo) {
        this.provinceNo = provinceNo;
    }

    public String getProvinceName() {
        return provinceName;
    }

    public void setProvinceName(String provinceName) {
        this.provinceName = provinceName;
    }

    public List<District> getDistricts() {
        return districts;
    }

    public void setDistricts(List<District> districts) {
        this.districts = districts;
    }
}
