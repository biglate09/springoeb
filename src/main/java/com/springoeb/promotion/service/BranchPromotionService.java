package com.springoeb.promotion.service;

import com.springoeb.promotion.model.BranchPromotion;
import com.springoeb.promotion.repository.BranchPromotionRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.LinkedHashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Set;

@Service
public class BranchPromotionService {
    @Autowired
    private BranchPromotionRepository branchPromotionRepository;

    public List<BranchPromotion> findByBranchNo(int branchNo){
        return branchPromotionRepository.findByBranchNo(branchNo);
    }

    public BranchPromotion findByBranchNoAndPromotionNo(int branchNo,int promotionNo){
        return branchPromotionRepository.findByBranchNoAndPromotionNo(branchNo,promotionNo);
    }

    public List<BranchPromotion> findAll(int restNo){
        List<BranchPromotion> branchPromotions = branchPromotionRepository.findDistinctByPromotion_RestNo(restNo);
        List<BranchPromotion> modificationList = new LinkedList<BranchPromotion>();
        Set<Integer> proNo = new LinkedHashSet<Integer>();
        for(BranchPromotion bp : branchPromotions) {
            if (!proNo.contains(bp.getPromotionNo())) {
                modificationList.add(bp);
                proNo.add(bp.getPromotionNo());
            }
        }

        return modificationList;
    }

    public void save(BranchPromotion branchPromotion){
        branchPromotionRepository.save(branchPromotion);
    }

    public void save(List<BranchPromotion> branchPromotions){
        branchPromotionRepository.save(branchPromotions);
    }
}