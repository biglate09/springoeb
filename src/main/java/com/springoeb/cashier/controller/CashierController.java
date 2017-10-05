package com.springoeb.cashier.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/cashier")
@Controller
public class CashierController {
    private static final String CASHIER_PATH = "/WEB-INF/cashier/";

    //-----------------------------------------------------------------------------------------------------------//
    @GetMapping("/cashier")
    public String toCashierIndex(Model model) {
        return CASHIER_PATH + "cashier.jsp";
    }
    //-----------------------------------------------------------------------------------------------------------//
}
