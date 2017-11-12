package com.springoeb.promotion.model_key;

import java.io.Serializable;

public class BranchPromotionId implements Serializable {
    private Integer branchNo;
    private Integer promotionNo;

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
}
