package com.springoeb.promotion.repository;

import com.springoeb.promotion.model.MenuGroupPromotion;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface MenuGroupPromotionRepository extends CrudRepository<MenuGroupPromotion,Integer>{
    void removeByPromotionNo(int promotionNo);
}
