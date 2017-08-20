package com.springoeb.promotion.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/promotion")
@Controller
public class PromotionController {
    private static final String PROMO_PATH = "/WEB-INF/promotion/";

    //-----------------------------------------------------------------------------------------------------------//
    @GetMapping("/promotion")
    public String toPromotionIndex(){
        return PROMO_PATH + "promotion.jsp";
    }
    //-----------------------------------------------------------------------------------------------------------//
}
