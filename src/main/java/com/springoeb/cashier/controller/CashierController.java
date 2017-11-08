package com.springoeb.cashier.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.springoeb.cashier.model.Bill;
import com.springoeb.cashier.model.Order;
import com.springoeb.cashier.service.BillService;
import com.springoeb.promotion.model.Promotion;
import com.springoeb.promotion.service.PromotionService;
import com.springoeb.system.model.BranchUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
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
    public String toCashierIndex(Model model, HttpSession session) {
        BranchUser branchUser = (BranchUser) (session.getAttribute("branchUser"));
        int restNo = branchUser.getBranch().getRestNo();
        List<Promotion> promotions = promotionService.findAvailablePromotion(restNo);
        model.addAttribute("promotions",promotions);
        return CASHIER_PATH + "cashier.jsp";
    }

    @ResponseBody
    @PostMapping("/getbills")
    public String getCashiers(HttpSession session) throws JsonProcessingException {
        BranchUser branchUser = (BranchUser) (session.getAttribute("branchUser"));
        int branchNo = branchUser.getBranchNo();
        List<Bill> bills = billService.findByTable_BranchNo(branchNo);
        ObjectMapper mapper = new ObjectMapper();
        String json = mapper.writeValueAsString(bills);
        return json;
    }

    @ResponseBody
    @PutMapping("/getbill/{billNo}")
    public String getCashier(@PathVariable("billNo") int billNo) throws JsonProcessingException {
        Bill bill = billService.findByBillNo(billNo);
        ObjectMapper mapper = new ObjectMapper();
        String json = mapper.writeValueAsString(bill);
        return json;
    }

    @ResponseBody
    @PostMapping("/checkbill/{billNo}")
    public void checkBill(@PathVariable("billNo") int billNo, HttpServletRequest request) throws Exception {
        Bill bill = billService.findByBillNo(billNo);
        List<Order> orders = bill.getOrders();
        int order_count = 0;
        for(Order o : orders){
            if(o.getStatus().equals(Order.SERVED) || o.getStatus().equals(Order.CANCELLED)){
                order_count++;
            }else{
                break;
            }
        }

        if(order_count == orders.size()) {
            Double totalAmount = Double.parseDouble(request.getParameter("totalAmount"));
            bill.setTotalAmount(totalAmount);
            bill.setStatus(Bill.PAID);
            billService.save(bill);
        }else{
            throw new Exception();
        }
    }
    //-----------------------------------------------------------------------------------------------------------//
}
