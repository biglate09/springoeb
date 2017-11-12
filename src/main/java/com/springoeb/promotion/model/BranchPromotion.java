package com.springoeb.promotion.model;

import com.springoeb.promotion.model_key.BranchPromotionId;

import javax.persistence.*;

@IdClass(BranchPromotionId.class)
@Entity(name = "Branch_Promotion")
public class BranchPromotion {
    @Id
    @Column(name = "branchNo")
    private Integer branchNo;
    @Id
    @Column(name = "promotionNo",updatable = true,insertable = true)
    private Integer promotionNo;
    @Column(name = "isAvailable")
    private boolean available;

    @ManyToOne
    @JoinColumn(name = "promotionNo",updatable = false,insertable = false)
    private Promotion promotion;

    public Integer getBranchNo() {
        return branchNo;
    }

    public void setBranchNo(Integer branchNo) {
        this.branchNo = branchNo;
    }

    public Integer getPromotionNo() {
        return promotionNo;
    }

    public void setPromotionNo(Integer promotionNo) {
        this.promotionNo = promotionNo;
    }

    public boolean isAvailable() {
        return available;
    }

    public void setAvailable(boolean available) {
        this.available = available;
    }

    public Promotion getPromotion() {
        return promotion;
    }

    public void setPromotion(Promotion promotion) {
        this.promotion = promotion;
    }
}
