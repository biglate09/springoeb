package com.springoeb.stock.service;

import com.springoeb.stock.model.StockCategory;
import com.springoeb.stock.repository.StockCategoryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StockCategoryService {
    @Autowired
    private StockCategoryRepository stockCategoryRepository;

    public List<StockCategory> findAll(){
        return stockCategoryRepository.findAll();
    }
}
