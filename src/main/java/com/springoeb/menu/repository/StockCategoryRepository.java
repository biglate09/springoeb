package com.springoeb.menu.repository;

import com.springoeb.menu.model.StockCategory;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface StockCategoryRepository extends CrudRepository<StockCategory,Integer> {
    List<StockCategory> findAll();
}
