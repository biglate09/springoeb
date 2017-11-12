package com.springoeb.promotion.repository;

import com.springoeb.promotion.model.BranchPromotion;
import com.springoeb.promotion.model.Promotion;
import com.springoeb.promotion.model_key.BranchPromotionId;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.sql.Date;
import java.util.Collection;
import java.util.List;

@Repository
public interface BranchPromotionRepository extends CrudRepository<BranchPromotion,BranchPromotionId>{
    List<BranchPromotion> findByBranchNo(int branchNo);
    List<BranchPromotion> findByBranchNoAndAvailableAndPromotion_FromDateLessThanEqualAndPromotion_ToDateGreaterThanEqualAndPromotion_DayIn(int branchNo, boolean available, Date fromDate, Date toDate, List<String> days);
    List<BranchPromotion> findDistinctByPromotion_RestNo(int restNo);
    void save(Collection<Promotion> branchPromotions);
    BranchPromotion findByBranchNoAndPromotionNo(int branchNo,int promotionNo);
}
