package com.springoeb.cashier.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.springoeb.cashier.model.Bill;
import com.springoeb.cashier.service.BillService;
import com.springoeb.promotion.service.PromotionService;
import com.springoeb.system.model.BranchUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@RequestMapping("/cashier")
@Controller
public class CashierController {
    private static final String CASHIER_PATH = "/WEB-INF/cashier/";
    @Autowired
    private PromotionService promotionService;
    @Autowired
    private BillService billService;
    //-----------------------------------------------------------------------------------------------------------//
    @GetMapping("/cashier")
    public String toCashierIndex(Model model) {
//        List<Promotion> promotions = promotionService.findAvailablePromotion();
//        model.addAttribute("promotions",promotions);
        return CASHIER_PATH + "cashier.jsp";
    }

    @PostMapping("/getcashier")
    public String getCashier(HttpSession session) throws JsonProcessingException {
        BranchUser branchUser = (BranchUser) (session.getAttribute("branchUser"));
        int branchNo = branchUser.getBranchNo();
        List<Bill> bills = billService.findByTable_BranchNo(branchNo);
        ObjectMapper mapper = new ObjectMapper();
        String json = mapper.writeValueAsString(bills);
        return json;
    }
    //-----------------------------------------------------------------------------------------------------------//
}
