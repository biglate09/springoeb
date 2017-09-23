package com.springoeb.promotion.repository;

import com.springoeb.promotion.model.Promotion;
import com.springoeb.promotion.model_key.MenuGroupPromotionId;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PromotionRepository extends CrudRepository<Promotion,MenuGroupPromotionId>{
    List<Promotion> findAll();
    Promotion findByPromotionNo(int promotionNo);
    void removeByPromotionNo(int promotionNo);
}
