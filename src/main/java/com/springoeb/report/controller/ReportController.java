package com.springoeb.report.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.springoeb.cashier.service.BillService;
import com.springoeb.cashier.service.OrderService;
import com.springoeb.employee.service.WorkHistoryService;
import com.springoeb.ledger.service.LedgerService;
import com.springoeb.menu.model.Menu;
import com.springoeb.menu.service.BranchMenuService;
import com.springoeb.report.model.IncomeExpenseBean;
import com.springoeb.system.model.BranchUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.net.URLDecoder;
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
    @Autowired
    private BillService billService;
    @Autowired
    private WorkHistoryService workHistoryService;

    public static final String MENU_REPORT = "menu";
    public static final String MENUSET_REPORT = "menuset";
    //-----------------------------------------------------------------------------------------------------------//

    @GetMapping("/menureport")
    public String toMenuReport(HttpSession session, Model model) {
        BranchUser branchUser = (BranchUser) (session.getAttribute("branchUser"));
        int branchNo = branchUser.getBranchNo();
        Date minDateMenu = orderService.findMinMenuOrderDateByBranchNo(branchNo);
        Date maxDateMenu = orderService.findMaxMenuOrderDateByBranchNo(branchNo);
        Date minDateMenuSet = orderService.findMinMenuSetOrderDateByBranchNo(branchNo);
        Date maxDateMenuSet = orderService.findMaxMenuSetOrderDateByBranchNo(branchNo);
        if (minDateMenu != null && maxDateMenu != null) {
            model.addAttribute("minDateMenu", new SimpleDateFormat("dd-MM-YYYY").format(minDateMenu));
            model.addAttribute("maxDateMenu", new SimpleDateFormat("dd-MM-YYYY").format(maxDateMenu));
        }
        if (minDateMenuSet != null && minDateMenuSet != null) {
            model.addAttribute("minDateMenuSet", new SimpleDateFormat("dd-MM-YYYY").format(minDateMenuSet));
            model.addAttribute("maxDateMenuSet", new SimpleDateFormat("dd-MM-YYYY").format(maxDateMenuSet));
        }

        model.addAttribute("today", new SimpleDateFormat("dd-MM-YYYY").format(new Date()));
        return REPORT_PATH + "menureport.jsp";
    }

    @GetMapping("/totalincome")
    public String toTotalReport(HttpSession session, Model model) {
        BranchUser branchUser = (BranchUser) (session.getAttribute("branchUser"));
        int branchNo = branchUser.getBranchNo();
        Date minDateTotal = ledgerService.findMinLedgerDateByBranchNo(branchNo);
        Date maxDateTotal = ledgerService.findMaxLedgerDateByBranchNo(branchNo);
        if (maxDateTotal != null && minDateTotal != null) {
            model.addAttribute("minDateTotal", new SimpleDateFormat("dd-MM-YYYY").format(minDateTotal));
            model.addAttribute("maxDateTotal", new SimpleDateFormat("dd-MM-YYYY").format(maxDateTotal));
        }
        model.addAttribute("today", new SimpleDateFormat("dd-MM-YYYY").format(new Date()));
        return REPORT_PATH + "totalincome.jsp";
    }

    @GetMapping("/emppayreport")
    public String toEmployeeReport(HttpSession session, Model model) {
        BranchUser branchUser = (BranchUser) (session.getAttribute("branchUser"));
        int branchNo = branchUser.getBranchNo();
        Date minDateWorkHist = workHistoryService.findMinWorkHistDateByBranchNo(branchNo);
        Date maxDateWorkHist = workHistoryService.findMaxWorkHistDateByBranchNo(branchNo);
        if (maxDateWorkHist != null && minDateWorkHist != null) {
            model.addAttribute("minDateWorkHist", new SimpleDateFormat("dd-MM-YYYY").format(minDateWorkHist));
            model.addAttribute("maxDateWorkHist", new SimpleDateFormat("dd-MM-YYYY").format(maxDateWorkHist));
        }
        model.addAttribute("today", new SimpleDateFormat("dd-MM-YYYY").format(new Date()));
        return REPORT_PATH + "emppayreport.jsp";
    }

    @GetMapping("/billreport")
    public String toBillReport(HttpSession session, Model model) {
        BranchUser branchUser = (BranchUser) (session.getAttribute("branchUser"));
        int branchNo = branchUser.getBranchNo();
        Date minDateBill = billService.findMinDateByBranchNo(branchNo);
        Date maxDateBill = billService.findMaxDateByBranchNo(branchNo);
        if (maxDateBill != null && minDateBill != null) {
            model.addAttribute("minDateBill", new SimpleDateFormat("dd-MM-YYYY").format(minDateBill));
            model.addAttribute("maxDateBill", new SimpleDateFormat("dd-MM-YYYY").format(maxDateBill));
        }
        model.addAttribute("today", new SimpleDateFormat("dd-MM-YYYY").format(new Date()));
        return REPORT_PATH + "billreport.jsp";
    }

    @GetMapping("/other")
    public String toOtherReport() {
        return REPORT_PATH + "other.jsp";
    }

    @ResponseBody
    @PostMapping("/bestsalemenu")
    public String getBestSaleMenu(HttpSession session, HttpServletRequest request) throws JsonProcessingException {
        String fromDate = request.getParameter("fromDate");
        String toDate = request.getParameter("toDate");
        BranchUser branchUser = (BranchUser) (session.getAttribute("branchUser"));
        int branchNo = branchUser.getBranchNo();
        Map<String, Long> menus = branchMenuService.getBestSaleMenu(branchNo, fromDate, toDate);
        ObjectMapper mapper = new ObjectMapper();
        String json = mapper.writeValueAsString(sortByValue(menus));
        return json;
    }

    @ResponseBody
    @PostMapping("/bestsalemenuset")
    public String getBestSaleMenuSet(HttpSession session, HttpServletRequest request) throws JsonProcessingException {
        String fromDate = request.getParameter("fromDate");
        String toDate = request.getParameter("toDate");
        BranchUser branchUser = (BranchUser) (session.getAttribute("branchUser"));
        int branchNo = branchUser.getBranchNo();
        Map<String, Long> menus = branchMenuService.getBestSaleMenuSet(branchNo, fromDate, toDate);
        ObjectMapper mapper = new ObjectMapper();
        String json = mapper.writeValueAsString(sortByValue(menus));
        return json;
    }

    @ResponseBody
    @PutMapping("/totalincome")
    public String getTotalIncome(HttpSession session, HttpServletRequest request) throws JsonProcessingException {
        String fromDate = request.getParameter("fromDate");
        String toDate = request.getParameter("toDate");
        BranchUser branchUser = (BranchUser) (session.getAttribute("branchUser"));
        int branchNo = branchUser.getBranchNo();
        Map<Integer, IncomeExpenseBean> totalIncome = ledgerService.findTotalIncomeExpense(branchNo, fromDate, toDate);
        ObjectMapper mapper = new ObjectMapper();
        String json = mapper.writeValueAsString(totalIncome);
        return json;
    }

    @ResponseBody
    @PutMapping("/getbillreport")
    public String getBillReport(HttpSession session, HttpServletRequest request) throws JsonProcessingException {
        String fromDate = request.getParameter("fromDate");
        String toDate = request.getParameter("toDate");
        BranchUser branchUser = (BranchUser) (session.getAttribute("branchUser"));
        int branchNo = branchUser.getBranchNo();
        Map<Integer, Double> totalIncome = billService.getBillReport(branchNo, fromDate, toDate);
        ObjectMapper mapper = new ObjectMapper();
        String json = mapper.writeValueAsString(totalIncome);
        return json;
    }

    @ResponseBody
    @PutMapping("/getempreport")
    public String getEmpReport(HttpSession session, HttpServletRequest request) throws JsonProcessingException {
        String fromDate = request.getParameter("fromDate");
        String toDate = request.getParameter("toDate");
        BranchUser branchUser = (BranchUser) (session.getAttribute("branchUser"));
        int branchNo = branchUser.getBranchNo();
        Map<Integer, Double> getEmpReport = workHistoryService.getEmpPayReport(branchNo, fromDate, toDate);
        ObjectMapper mapper = new ObjectMapper();
        String json = mapper.writeValueAsString(getEmpReport);
        return json;
    }

    /////////////////////////////////////////////////////////////////////////////////////////////////

    @ResponseBody
    @PostMapping("/exportreport/{data}")
    public String exportReport(@PathVariable("data") String data, HttpSession session, HttpServletRequest request) throws Exception {
        String filePath = null;
        if (data.equals(MENU_REPORT)) {
            filePath = writeMenuReport(data, session, request, true);
        } else if (data.equals(MENUSET_REPORT)) {
            filePath = writeMenuReport(data, session, request, false);
        } else {
            throw new Exception();
        }
        return filePath;
    }

    private String writeMenuReport(String data, HttpSession session, HttpServletRequest request, boolean isMenu) throws IOException {
        String filePath = null;
        BranchUser branchUser = (BranchUser) (session.getAttribute("branchUser"));
        int branchNo = branchUser.getBranchNo();
        String fromDate = request.getParameter("fromDate");
        String toDate = request.getParameter("toDate");
        if(isMenu) {
            Map<Menu, Long> menus = branchMenuService.getBestSaleMenuObject(branchNo, fromDate, toDate);
            if (menus != null && menus.size() > 0) {
                String pathname = request.getServletContext().getRealPath("/report/") + data + fromDate + "~" + toDate;
                File file = new File(URLDecoder.decode(pathname + ".csv", "UTF-8"));
                BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(file), "UTF-8"));
                //get key
                writer.write("ลำดับที่,ชื่อเมนูอาหาร,ประเภทเมนู,ราคา,จำนวนที่ขายได้\n");
                int index = 1;
                for (Map.Entry<Menu, Long> menuMap : sortByValue(menus)) {
                    Menu menu = menuMap.getKey();
                    long value = menuMap.getValue();
                    writer.write(index++ + "," + menu.getMenuNameTH() + "," + menu.getMenuGroup().getMenuGroupNameTH() + "," + menu.getMenuPrice() + "," + value + "\n");
                }
                writer.close();

                filePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/report/" + data + fromDate + "~" + toDate + ".csv";
            }
        }else{
            Map<Menu, Long> menus = branchMenuService.getBestSaleMenuSetObject(branchNo, fromDate, toDate);
            if (menus != null && menus.size() > 0) {
                String pathname = request.getServletContext().getRealPath("/report/") + data + fromDate + "~" + toDate;
                File file = new File(URLDecoder.decode(pathname + ".csv", "UTF-8"));
                BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(file), "UTF-8"));
                //get key
                writer.write("ลำดับที่,ชื่อเซตเมนูอาหาร,ราคา,จำนวนที่ขายได้\n");
                int index = 1;
                for (Map.Entry<Menu, Long> menuMap : sortByValue(menus)) {
                    Menu menu = menuMap.getKey();
                    long value = menuMap.getValue();
                    writer.write(index++ + "," + menu.getMenuNameTH() + "," + menu.getMenuPrice() + "," + value + "\n");
                }
                writer.close();

                filePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/report/" + data + fromDate + "~" + toDate + ".csv";
            }
        }
        return filePath;
    }

    private static <K, V extends Comparable<? super V>> List<Map.Entry<K, V>> sortByValue(Map<K, V> map) {

        List<Map.Entry<K, V>> sortedEntries = new ArrayList<Map.Entry<K, V>>(map.entrySet());

        Collections.sort(sortedEntries,
                new Comparator<Map.Entry<K, V>>() {
                    @Override
                    public int compare(Map.Entry<K, V> e1, Map.Entry<K, V> e2) {
                        return e2.getValue().compareTo(e1.getValue());
                    }
                }
        );

        return sortedEntries;
    }
}