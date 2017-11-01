package com.springoeb.report.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.springoeb.cashier.service.OrderService;
import com.springoeb.ledger.service.LedgerService;
import com.springoeb.menu.service.BranchMenuService;
import com.springoeb.system.model.BranchUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.*;

@RequestMapping("/report")
@Controller
public class ReportController {
    private static final String REPORT_PATH = "/WEB-INF/report/";

    @Autowired
    private BranchMenuService branchMenuService;
    @Autowired
    private LedgerService ledgerService;
    @Autowired
    private OrderService orderService;
    //-----------------------------------------------------------------------------------------------------------//

    @GetMapping("/menureport")
    public String toMenuReport(HttpSession session,Model model){
        BranchUser branchUser = (BranchUser) (session.getAttribute("branchUser"));
        int branchNo = branchUser.getBranchNo();
        Date minDateMenu = orderService.findMinMenuOrderDateByBranchNo(branchNo);
        Date maxDateMenu = orderService.findMaxMenuOrderDateByBranchNo(branchNo);
        Date minDateMenuSet = orderService.findMinMenuSetOrderDateByBranchNo(branchNo);
        Date maxDateMenuSet = orderService.findMaxMenuSetOrderDateByBranchNo(branchNo);
        model.addAttribute("minDateMenu",new SimpleDateFormat("dd-MM-YYYY").format(minDateMenu));
        model.addAttribute("maxDateMenu",new SimpleDateFormat("dd-MM-YYYY").format(maxDateMenu));
        model.addAttribute("minDateMenu",new SimpleDateFormat("dd-MM-YYYY").format(minDateMenuSet));
        model.addAttribute("maxDateMenu",new SimpleDateFormat("dd-MM-YYYY").format(maxDateMenuSet));
        return REPORT_PATH + "menureport.jsp";
    }

    @GetMapping("/totalincome")
    public String toTotalReport(){
        return REPORT_PATH + "totalincome.jsp";
    }

    @GetMapping("/emppayreport")
    public String toEmployeeReport(){
        return REPORT_PATH + "emppayreport.jsp";
    }

    @GetMapping("/matreport")
    public String toMaterialReport(){
        return REPORT_PATH + "matreport.jsp";
    }

    @GetMapping("/billreport")
    public String toBillReport(){
        return REPORT_PATH + "billreport.jsp";
    }

    @GetMapping("/other")
    public String toOtherReport(){
        return REPORT_PATH + "other.jsp";
    }

    @ResponseBody
    @PostMapping("/bestsalemenu")
    public String getBestSaleMenu(HttpSession session, HttpServletRequest request) throws JsonProcessingException {
        int year = Integer.parseInt(request.getParameter("year"));
        int month = Integer.parseInt(request.getParameter("month"));
        BranchUser branchUser = (BranchUser) (session.getAttribute("branchUser"));
        int branchNo = branchUser.getBranchNo();
        Map<String,Long> menus = branchMenuService.getBestSaleMenu(branchNo,year,month);
        ObjectMapper mapper = new ObjectMapper();
        String json = mapper.writeValueAsString(sortByValue(menus));
        return json;
    }

    @ResponseBody
    @PostMapping("/bestsalemenuset")
    public String getBestSaleMenuSet(HttpSession session, HttpServletRequest request) throws JsonProcessingException {
        int year = Integer.parseInt(request.getParameter("year"));
        int month = Integer.parseInt(request.getParameter("month"));
        BranchUser branchUser = (BranchUser) (session.getAttribute("branchUser"));
        int branchNo = branchUser.getBranchNo();
        Map<String,Long> menus = branchMenuService.getBestSaleMenuSet(branchNo,year,month);
        ObjectMapper mapper = new ObjectMapper();
        String json = mapper.writeValueAsString(sortByValue(menus));
        return json;
    }

//    @ResponseBody
//    @PostMapping("/totalincome")
//    public String getTotalIncome(HttpSession session, HttpServletRequest request) throws JsonProcessingException {
//        int year = Integer.parseInt(request.getParameter("year"));
//        int month = Integer.parseInt(request.getParameter("month"));
//        BranchUser branchUser = (BranchUser) (session.getAttribute("branchUser"));
//        int branchNo = branchUser.getBranchNo();
//        Map<Integer,IncomeExpenseBean> totalIncome = ledgerService.findTotalIncomeExpense(branchNo,month,year);
//        ObjectMapper mapper = new ObjectMapper();
//        String json = mapper.writeValueAsString(totalIncome);
//        return json;
//    }

    private static <K,V extends Comparable<? super V>>
    List<Map.Entry<K, V>> sortByValue(Map<K,V> map) {

        List<Map.Entry<K,V>> sortedEntries = new ArrayList<Map.Entry<K,V>>(map.entrySet());

        Collections.sort(sortedEntries,
                new Comparator<Map.Entry<K,V>>() {
                    @Override
                    public int compare(Map.Entry<K,V> e1, Map.Entry<K,V> e2) {
                        return e2.getValue().compareTo(e1.getValue());
                    }
                }
        );

        return sortedEntries;
    }
}