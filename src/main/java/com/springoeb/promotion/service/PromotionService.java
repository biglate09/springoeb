package com.springoeb.promotion.service;

import com.springoeb.promotion.model.Promotion;
import com.springoeb.promotion.repository.PromotionRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.sql.Date;
import java.util.Calendar;
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

    public List<Promotion> findAvailablePromotion(int restNo){
        String[] dayArray = {"MON","TUE","WED","THU","FRI","SAT","SUN"};
        Calendar calendar = Calendar.getInstance();
        int day = calendar.get(Calendar.DAY_OF_WEEK);

        return promotionRepository.findByFromDateLessThanEqualAndToDateGreaterThanEqualAndDayAndRestNo(new Date(System.currentTimeMillis()),new Date(System.currentTimeMillis()), dayArray[day-1], restNo);
    }

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