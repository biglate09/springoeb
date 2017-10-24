package com.springoeb.promotion.service;

import com.springoeb.promotion.model.Promotion;
import com.springoeb.promotion.repository.PromotionRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

@Service
public class PromotionService {
    @Autowired
    private PromotionRepository promotionRepository;

    public void save(Promotion promotion){
        promotionRepository.save(promotion);
    }

    public List<Promotion> findPromotions(int restNo){
        return promotionRepository.findByRestNoOrderByFromDate(restNo);
    }

//    public List<Promotion> findAvailablePromotion(){
//        return promotionRepository.findByAvailableAndFromDateGreaterThanEqualAndAvailableLessThanEqual(true,new Date(System.currentTimeMillis()),new Date(System.currentTimeMillis()));
//    }

    public Promotion findByPromotionNo(int promotionNo){
        return promotionRepository.findByPromotionNo(promotionNo);
    }

    @Transactional
    public Promotion removeByPromotionNo(int promotionNo){
        Promotion promotion = promotionRepository.findByPromotionNo(promotionNo);
        promotionRepository.removeByPromotionNo(promotionNo);
        return promotion;
    }
}