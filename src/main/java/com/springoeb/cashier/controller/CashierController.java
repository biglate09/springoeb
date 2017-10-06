package com.springoeb.cashier.controller;

import com.springoeb.promotion.model.Promotion;
import com.springoeb.promotion.service.PromotionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@RequestMapping("/cashier")
@Controller
public class CashierController {
    private static final String CASHIER_PATH = "/WEB-INF/cashier/";
    @Autowired
    private PromotionService promotionService;
    //-----------------------------------------------------------------------------------------------------------//
    @GetMapping("/cashier")
    public String toCashierIndex(Model model) {
        List<Promotion> promotions = promotionService.findAvailablePromotion();
        model.addAttribute("promotions",promotions);
        return CASHIER_PATH + "cashier.jsp";
    }
    //-----------------------------------------------------------------------------------------------------------//
}
