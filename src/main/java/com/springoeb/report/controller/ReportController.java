package com.springoeb.report.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.springoeb.menu.model.Menu;
import com.springoeb.menu.service.BranchMenuService;
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
    private static final String KITCHEN_PATH = "/WEB-INF/report/";

    @Autowired
    private BranchMenuService branchMenuService;
    //-----------------------------------------------------------------------------------------------------------//

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

//    @ResponseBody
//    @PostMapping("/bestsalemenugroup")
//    public String getBestSaleMenuGroup(HttpSession session){
//        BranchUser branchUser = (BranchUser) (session.getAttribute("branchUser"));
//        int branchNo = branchUser.getBranchNo();
//        Map<Menu,Long> menuGroups = MenuGroupService
//        ObjectMapper mapper = new ObjectMapper();
//        String json = mapper.writeValueAsString(menuGroups);
//        return json;
//    }
}