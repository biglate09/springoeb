package com.springoeb.cashier.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.springoeb.cashier.model.Bill;
import com.springoeb.cashier.model.Order;
import com.springoeb.cashier.service.BillService;
import com.springoeb.ledger.model.Ledger;
import com.springoeb.ledger.model.LedgerType;
import com.springoeb.ledger.service.LedgerService;
import com.springoeb.promotion.model.Promotion;
import com.springoeb.promotion.service.PromotionService;
import com.springoeb.system.model.BranchUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;
import java.sql.Date;
import java.text.DecimalFormat;
import java.util.List;

@RequestMapping("/cashier")
@Controller
public class CashierController {
    private static final String CASHIER_PATH = "/WEB-INF/cashier/";
    @Autowired
    private PromotionService promotionService;
    @Autowired
    private BillService billService;
    @Autowired
    private LedgerService ledgerService;
    //-----------------------------------------------------------------------------------------------------------//
    @GetMapping("/cashier")
    public String toCashierIndex(Model model, HttpSession session) {
        BranchUser branchUser = (BranchUser) (session.getAttribute("branchUser"));
        int restNo = branchUser.getBranch().getRestNo();
        List<Promotion> promotions = promotionService.findAvailablePromotion(restNo);
        model.addAttribute("promotions",promotions);
        return CASHIER_PATH + "cashier.jsp";
    }

    @GetMapping("/billpage")
    public String toBillPage(Model model, HttpSession session) {
        return CASHIER_PATH + "billpage.jsp";
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
    @PostMapping("/getallbills")
    public String getAllBills(HttpSession session) throws JsonProcessingException {
        BranchUser branchUser = (BranchUser) (session.getAttribute("branchUser"));
        int branchNo = branchUser.getBranchNo();
        List<Bill> bills = billService.findByAllTable_BranchNo(branchNo);
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

    @Transactional
    @ResponseBody
    @PostMapping("/checkbill/{billNo}")
    public void checkBill(@PathVariable("billNo") int billNo, HttpSession session, HttpServletRequest request) throws Exception {
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
            Double amount = Double.parseDouble(request.getParameter("amount"));
            Double receive = Double.parseDouble(request.getParameter("receive"));
            bill.setTotalAmount(totalAmount);
            bill.setAmount(amount);
            bill.setReceive(receive);
            bill.setStatus(Bill.PAID);
            int type = Integer.parseInt(request.getParameter("type"));
            String value = request.getParameter("value");

            if(type == 1){
                bill.setPromotionDesc(value.trim());
            }else if(type == 2){
                DecimalFormat df = new DecimalFormat("#,###,###,##0.00");
                bill.setPromotionDesc("ลดพิเศษ : " + (value.indexOf("%") == -1 ? df.format(Double.parseDouble(value)) +" บาท" : df.format(Double.parseDouble(value.substring(0,value.length()-1)))+ " %"));
            }

            billService.save(bill);
            BranchUser branchUser = (BranchUser) (session.getAttribute("branchUser"));
            int branchNo = branchUser.getBranchNo();
            updateBillLedger(bill.getBillDate(),branchNo);
        }else{
            throw new Exception();
        }
    }

    private void updateBillLedger(Date date, int branchNo){
        Double sumPay = billService.sumTotalAmountByDateAndBranchNo(date,branchNo);
        Ledger ledger = ledgerService.findByDateAndBranchNoAndLedgerTypeNo(date, branchNo, LedgerType.PROFIT);
        if (ledger == null) {
            ledger = new Ledger();
            ledger.setLedgerTypeNo(LedgerType.PROFIT);
            ledger.setDate(date);
            ledger.setBranchNo(branchNo);
        }

        if (sumPay == null || sumPay == 0) {
            if (ledger != null && ledger.getLedgerNo() != null) {
                ledgerService.removeByLedgerNoAndBranchNo(ledger.getLedgerNo(), branchNo);
            }
        } else {
            ledger.setAmount(sumPay);
            ledgerService.save(ledger);
        }
    }
    //-----------------------------------------------------------------------------------------------------------//
}
