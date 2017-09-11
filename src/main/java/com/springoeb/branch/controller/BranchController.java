package com.springoeb.branch.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/branch")
@Controller
public class BranchController {
    private static final String BRANCH_PATH = "/WEB-INF/branch/";

    //-----------------------------------------------------------------------------------------------------------//
    @GetMapping("/branches")
    public String toBranchIndex(){
        return BRANCH_PATH + "branches.jsp";
    }
    //-----------------------------------------------------------------------------------------------------------//
    @GetMapping("/mybranch")
    public String toMyBranchIndex(){
        return BRANCH_PATH + "mybranch.jsp";
    }
    //-----------------------------------------------------------------------------------------------------------//
    @GetMapping("/member")
    public String toMemberIndex(){
        return BRANCH_PATH + "member.jsp";
    }
    //-----------------------------------------------------------------------------------------------------------//
}
