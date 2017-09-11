package com.springoeb.branch.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.springoeb.branch.model.Branch;
import com.springoeb.branch.service.BranchService;
import com.springoeb.system.model.BranchUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;

@RequestMapping("/branch")
@Controller
public class BranchController {
    @Autowired
    private BranchService branchService;
    private static final String BRANCH_PATH = "/WEB-INF/branch/";

    //-----------------------------------------------------------------------------------------------------------//
    @GetMapping("/branches")
    public String toBranchIndex() {
        return BRANCH_PATH + "branches.jsp";
    }

    //-----------------------------------------------------------------------------------------------------------//
    @GetMapping("/mybranch")
    public String toMyBranchIndex() {
        return BRANCH_PATH + "mybranch.jsp";
    }

    @ResponseBody
    @PutMapping("/branch/getmybranch")
    public String getBranch(HttpSession session) throws JsonProcessingException {
        int branchNo = ((BranchUser) (session.getAttribute("branchUser"))).getBranchNo();
        Branch branch = branchService.getBranch(branchNo);
        ObjectMapper mapper = new ObjectMapper();
        String json = mapper.writeValueAsString(branch);
        return json;
    }

    @ResponseBody
    @PostMapping("/branch/managemybranch")
    public void addOrEditMyBranch(@ModelAttribute("branch") Branch branch){

    }

    //-----------------------------------------------------------------------------------------------------------//
    @GetMapping("/member")
    public String toMemberIndex() {
        return BRANCH_PATH + "member.jsp";
    }
    //-----------------------------------------------------------------------------------------------------------//
}
