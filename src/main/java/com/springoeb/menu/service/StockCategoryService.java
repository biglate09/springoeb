package com.springoeb.menu.service;

import com.springoeb.menu.repository.StockCategoryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class StockCategoryService {
    @Autowired
    private StockCategoryRepository stockCategoryRepository;
}
