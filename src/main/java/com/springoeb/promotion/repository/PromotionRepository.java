package com.springoeb.promotion.repository;

import com.springoeb.promotion.model.Promotion;
import com.springoeb.promotion.model_key.MenuGroupPromotionId;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.sql.Date;
import java.util.List;

@Repository
public interface PromotionRepository extends CrudRepository<Promotion,MenuGroupPromotionId>{
    List<Promotion> findAll();
    List<Promotion> findByFromDateLessThanEqualAndToDateGreaterThanEqualAndDayAndRestNo(Date fromDate,Date toDate,String proDay,int restNo);
    Promotion findByPromotionNo(int promotionNo);
    void removeByPromotionNo(int promotionNo);
    List<Promotion> findByRestNoOrderByFromDate(int restNo);
}
