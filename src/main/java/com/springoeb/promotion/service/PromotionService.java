package com.springoeb.promotion.service;

import com.springoeb.promotion.model.BranchPromotion;
import com.springoeb.promotion.model.Promotion;
import com.springoeb.promotion.repository.BranchPromotionRepository;
import com.springoeb.promotion.repository.PromotionRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.sql.Date;
import java.util.Calendar;
import java.util.LinkedList;
import java.util.List;

@Service
public class PromotionService {
    @Autowired
    private PromotionRepository promotionRepository;
    @Autowired
    private BranchPromotionRepository branchPromotionRepository;

    public void save(Promotion promotion){
        promotionRepository.save(promotion);
    }

    public List<Promotion> findPromotions(int restNo){
        return promotionRepository.findByRestNoOrderByFromDate(restNo);
    }

    public List<Promotion> findAvailablePromotion(int branchNo){
        String[] dayArray = {"SUN","MON","TUE","WED","THU","FRI","SAT"};
        Calendar calendar = Calendar.getInstance();
        int day = calendar.get(Calendar.DAY_OF_WEEK);
        List<String> days = new LinkedList<String>();
        days.add("EVE");
        days.add(dayArray[day-1]);
        List<BranchPromotion> branchPromotions = branchPromotionRepository.findByBranchNoAndAvailableAndPromotion_FromDateLessThanEqualAndPromotion_ToDateGreaterThanEqualAndPromotion_DayIn(branchNo,true,new Date(System.currentTimeMillis()),new Date(System.currentTimeMillis()),days);
        List<Promotion> promotions = new LinkedList<Promotion>();
        for(BranchPromotion bp : branchPromotions){
            promotions.add(bp.getPromotion());
        }
        return promotions;
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

    public List<Promotion> getPromotionOfficial(int restNo){
        return promotionRepository.findByOfficialAndRestNo(true,restNo);
    }
}