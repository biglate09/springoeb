package com.springoeb.promotion.model;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.springoeb.menu.model.MenuGroup;
import com.springoeb.promotion.model_key.MenuGroupPromotionId;

import javax.persistence.*;

@Entity(name = "MenuGroup_Promotion")
@IdClass(MenuGroupPromotionId.class)
public class MenuGroupPromotion {
    @Id
    @Column(name = "promotionNo",updatable = true,insertable = true)
    private Integer promotionNo;
    @Id
    @Column(name = "menuGroupNo",updatable = true,insertable = true)
    private Integer menuGroupNo;

    @JsonBackReference
    @ManyToOne
    @JoinColumn(name = "promotionNo",updatable = false,insertable = false)
    private Promotion promotion;

    @ManyToOne
    @JoinColumn(name = "menuGroupNo",updatable = false,insertable = false)
    private MenuGroup menuGroup;

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

    public Promotion getPromotion() {
        return promotion;
    }

    public void setPromotion(Promotion promotion) {
        this.promotion = promotion;
    }

    public MenuGroup getMenuGroup() {
        return menuGroup;
    }

    public void setMenuGroup(MenuGroup menuGroup) {
        this.menuGroup = menuGroup;
    }
}
