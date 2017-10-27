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

import javax.servlet.http.HttpSession;
import java.util.Map;

@RequestMapping("/report")
@Controller
public class ReportController {
    private static final String KITCHEN_PATH = "/WEB-INF/report/";

    @Autowired
    private BranchMenuService branchMenuService;
    //-----------------------------------------------------------------------------------------------------------//

    @PostMapping("/bestsalemenu")
    public String getBestSaleMenu(HttpSession session) throws JsonProcessingException {
        BranchUser branchUser = (BranchUser) (session.getAttribute("branchUser"));
        int branchNo = branchUser.getBranchNo();
        Map<Menu,Long> menus = branchMenuService.getBestSaleMenu(branchNo);
        ObjectMapper mapper = new ObjectMapper();
        String json = mapper.writeValueAsString(menus);
        return json;
    }
}
