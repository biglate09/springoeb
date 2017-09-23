package com.springoeb.promotion.model_key;

import java.io.Serializable;

public class MenuGroupPromotionId implements Serializable {
    private Integer promotionNo;
    private Integer menuGroupNo;

    public Integer getPromotionNo() {
        return promotionNo;
    }

    public void setPromotionNo(Integer promotionNo) {
        this.promotionNo = promotionNo;
    }

    public Integer getMenuGroupNo() {
        return menuGroupNo;
    }

    public void setMenuGroupNo(Integer menuGroupNo) {
        this.menuGroupNo = menuGroupNo;
    }
}
