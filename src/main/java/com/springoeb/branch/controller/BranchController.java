package com.springoeb.branch.controller;

import com.springoeb.branch.model.Branch;
import com.springoeb.branch.service.BranchService;
import com.springoeb.system.model.BranchUser;
import com.springoeb.system.model.Province;
import com.springoeb.system.service.ProvinceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@RequestMapping("/branch")
@Controller
public class BranchController {
    @Autowired
    private BranchService branchService;
    @Autowired
    private ProvinceService provinceService;
    private static final String BRANCH_PATH = "/WEB-INF/branch/";

    //-----------------------------------------------------------------------------------------------------------//
    @GetMapping("/branches")
    public String toBranchIndex() {
        return BRANCH_PATH + "branches.jsp";
    }

    //-----------------------------------------------------------------------------------------------------------//
    @GetMapping("/mybranch")
    public String toMyBranchIndex(HttpServletRequest request,Model model) {
        List<Province> provinces = provinceService.findAll();
        model.addAttribute("provinces",provinces);
        if(request.getParameter("edit") != null){
            model.addAttribute("edit",true);
        }
        return BRANCH_PATH + "mybranch.jsp";
    }

    @PostMapping("/managemybranch")
    public void addOrEditMyBranch(@ModelAttribute("branch") Branch branch, HttpSession session, HttpServletRequest request, HttpServletResponse response) throws IOException {
        int branchNo = ((BranchUser)(session.getAttribute("branchUser"))).getBranchNo();
        branch.setBranchNo(branchNo);
        branchService.save(branch);

        BranchUser branchUser = (BranchUser) session.getAttribute("branchUser");
        branchUser.setBranch(branch);
        session.setAttribute("branchUser", branchUser);

        response.sendRedirect(request.getContextPath() + "/branch/mybranch?edit=true");
    }

    //-----------------------------------------------------------------------------------------------------------//
    @GetMapping("/member")
    public String toMemberIndex() {
        return BRANCH_PATH + "member.jsp";
    }
    //-----------------------------------------------------------------------------------------------------------//
}
