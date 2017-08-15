package com.springoeb.stock.controller;

import com.springoeb.stock.service.StockCategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/stock")
@Controller
public class StockController {
    @Autowired
    private StockCategoryService stockCategoryService;

    //-----------------------------------------------------------------------------------------------------------//

    //-----------------------------------------------------------------------------------------------------------//
}
