package com.springoeb.report.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.springoeb.menu.model.Menu;
import com.springoeb.menu.model.MenuGroup;
import com.springoeb.menu.service.BranchMenuService;
import com.springoeb.menu.service.MenuGroupService;
import com.springoeb.system.model.BranchUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.Map;

@RequestMapping("/report")
@Controller
public class ReportController {
    private static final String REPORT_PATH = "/WEB-INF/report/";

    @Autowired
    private BranchMenuService branchMenuService;
    @Autowired
    private MenuGroupService menuGroupService;
    //-----------------------------------------------------------------------------------------------------------//

//    @GetMapping("/")
//    public String toMenuReport(){
//        return REPORT_PATH + ".jsp";
//    }
//
//    @GetMapping("/")
//    public String toTotalReport(){
//        return REPORT_PATH + ".jsp";
//    }
//
//    @GetMapping("/")
//    public String toEmployeeReport(){
//        return REPORT_PATH + ".jsp";
//    }
//
//    @GetMapping("/")
//    public String toMaterialReport(){
//        return REPORT_PATH + ".jsp";
//    }
//
//    @GetMapping("/")
//    public String toBillReport(){
//        return REPORT_PATH + ".jsp";
//    }
//
//    @GetMapping("/")
//    public String toOtherReport(){
//        return REPORT_PATH + ".jsp";
//    }

    @ResponseBody
    @PostMapping("/bestsalemenu")
    public String getBestSaleMenu(HttpSession session) throws JsonProcessingException {
        BranchUser branchUser = (BranchUser) (session.getAttribute("branchUser"));
        int branchNo = branchUser.getBranchNo();
        Map<Menu,Long> menus = branchMenuService.getBestSaleMenu(branchNo);
        ObjectMapper mapper = new ObjectMapper();
        String json = mapper.writeValueAsString(menus);
        return json;
    }

    @ResponseBody
    @PostMapping("/bestsalemenuset")
    public String getBestSaleMenuSet(HttpSession session) throws JsonProcessingException {
        BranchUser branchUser = (BranchUser) (session.getAttribute("branchUser"));
        int branchNo = branchUser.getBranchNo();
        Map<Menu,Long> menus = branchMenuService.getBestSaleMenuSet(branchNo);
        ObjectMapper mapper = new ObjectMapper();
        String json = mapper.writeValueAsString(menus);
        return json;
    }

    @ResponseBody
    @PostMapping("/bestsalemenugroup")
    public String getBestSaleMenuGroup(HttpSession session) throws JsonProcessingException {
        BranchUser branchUser = (BranchUser) (session.getAttribute("branchUser"));
        int restNo = branchUser.getBranch().getRestNo();
        Map<MenuGroup,Long> menuGroups = menuGroupService.getBestSaleMenuGroup(restNo);
        ObjectMapper mapper = new ObjectMapper();
        String json = mapper.writeValueAsString(menuGroups);
        return json;
    }
}