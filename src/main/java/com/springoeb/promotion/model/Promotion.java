package com.springoeb.promotion.model;

import com.fasterxml.jackson.annotation.JsonManagedReference;

import javax.persistence.*;
import java.sql.Date;
import java.util.List;

@Entity
public class Promotion {
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Id
    private Integer promotionNo;
    @Column(name = "promotion_name_TH")
    private String promotionNameTH;
    @Column(name = "promotion_name_EN")
    private String promotionNameEN;
    private String promotionDesc;
    private Double discount;
    private String promotionPicPath;
    private Date fromDate;
    private Date toDate;
    private String day;
    private boolean available;

    @JsonManagedReference
    @OneToMany(fetch = FetchType.LAZY, mappedBy = "promotion")
    private List<MenuGroupPromotion> menuGroupPromotions;

    public static String MONDAY = "MON";
    public static String TUESDAY = "TUE";
    public static String WEDNESDAY = "WED";
    public static String THURSDAY = "THU";
    public static String FRIDAY = "FRI";
    public static String SATURDAY = "SAT";
    public static String SUNDAY = "SUN";

    public Integer getPromotionNo() {
        return promotionNo;
    }

    public void setPromotionNo(Integer promotionNo) {
        this.promotionNo = promotionNo;
    }

    public String getPromotionNameTH() {
        return promotionNameTH;
    }

    public void setPromotionNameTH(String promotionNameTH) {
        this.promotionNameTH = promotionNameTH;
    }

    public String getPromotionNameEN() {
        return promotionNameEN;
    }

    public void setPromotionNameEN(String promotionNameEN) {
        this.promotionNameEN = promotionNameEN;
    }

    public String getPromotionDesc() {
        return promotionDesc;
    }

    public void setPromotionDesc(String promotionDesc) {
        this.promotionDesc = promotionDesc;
    }

    public Double getDiscount() {
        return discount;
    }

    public void setDiscount(Double discount) {
        this.discount = discount;
    }

    public String getPromotionPicPath() {
        return promotionPicPath;
    }

    public void setPromotionPicPath(String promotionPicPath) {
        this.promotionPicPath = promotionPicPath;
    }

    public Date getFromDate() {
        return fromDate;
    }

    public void setFromDate(Date fromDate) {
        this.fromDate = fromDate;
    }

    public Date getToDate() {
        return toDate;
    }

    public void setToDate(Date toDate) {
        this.toDate = toDate;
    }

    public String getDay() {
        return day;
    }

    public void setDay(String day) {
        this.day = day;
    }

    public boolean isAvailable() {
        return available;
    }

    public void setAvailable(boolean available) {
        this.available = available;
    }

    public List<MenuGroupPromotion> getMenuGroupPromotions() {
        return menuGroupPromotions;
    }

    public void setMenuGroupPromotions(List<MenuGroupPromotion> menuGroupPromotions) {
        this.menuGroupPromotions = menuGroupPromotions;
    }
}
