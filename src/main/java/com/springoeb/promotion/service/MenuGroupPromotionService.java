package com.springoeb.promotion.service;

import com.springoeb.promotion.model.MenuGroupPromotion;
import com.springoeb.promotion.repository.MenuGroupPromotionRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MenuGroupPromotionService {
    @Autowired
    private MenuGroupPromotionRepository menuGroupPromotionRepository;

    public void save(List<MenuGroupPromotion> menuGroupPromotionList){
        menuGroupPromotionRepository.save(menuGroupPromotionList);
    }

    public void removeByPromotionNo(int promotionNo){
        menuGroupPromotionRepository.removeByPromotionNo(promotionNo);
    }
}