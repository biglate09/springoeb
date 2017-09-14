package com.springoeb.branch.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.springoeb.branch.model.Branch;
import com.springoeb.branch.service.BranchService;
import com.springoeb.system.model.BranchUser;
import com.springoeb.system.model.Province;
import com.springoeb.system.model.Role;
import com.springoeb.system.service.BranchUserService;
import com.springoeb.system.service.EmailService;
import com.springoeb.system.service.ProvinceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;
import java.io.IOException;
import java.util.List;

@RequestMapping("/branch")
@Controller
public class BranchController {
    @Autowired
    private BranchService branchService;
    @Autowired
    private BranchUserService branchUserService;
    @Autowired
    private ProvinceService provinceService;
    @Autowired
    EmailService emailService;

    private static final String BRANCH_PATH = "/WEB-INF/branch/";

    //-----------------------------------------------------------------------------------------------------------//
    @GetMapping("/branches")
    public String toBranchIndex() {
        return BRANCH_PATH + "branches.jsp";
    }

    @PostMapping("/getbranches")
    @ResponseBody
    public String getBranches() throws JsonProcessingException {
        List<Branch> branches = branchService.getAllBranches();
        ObjectMapper mapper = new ObjectMapper();
        String json = mapper.writeValueAsString(branches);
        return json;
    }

    @Transactional
    @DeleteMapping("/deletebranch/{branchNo}")
    @ResponseBody
    public void deleteBranch(@PathVariable("branchNo") int branchNo) {
        branchService.removeByBranchNo(branchNo);
    }

    @Transactional
    @PostMapping("/managebranch")
    @ResponseBody
    public void managebranch(@ModelAttribute("branch") Branch branch, HttpServletRequest request) {
        String username = request.getParameter("username");
        Branch insertedBranch = branchService.save(branch);
        int branchNo = insertedBranch.getBranchNo();
        BranchUser branchUser = new BranchUser();
        branchUser.setBranchNo(branchNo);
        branchUser.setUsername(username);
        branchUser.setRoleNo(Role.MANAGER);
        branchUserService.save(branchUser);
        String email = request.getParameter("email");
        String subject = "[ระบบ OrderEatBill] ตั้งค่าการลงชื่อเข้าใช้ระบบใบฐานะแอดมิน";
        String tokenUsername = getBcrypt(username);
        String msg = "Username : " + username + "\nกรุณาคลิกลิงก์ด้านล่างเพื่อสร้าง Password\n" + request.getScheme() + "://" + request.getServerName() + "/system/register/" + tokenUsername;
        emailService.sendMail(email, subject, msg);
    }

    private String getBcrypt(String username){
        BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();
        return bCryptPasswordEncoder.encode(username);
    }

    //-----------------------------------------------------------------------------------------------------------//
    @GetMapping("/mybranch")
    public String toMyBranchIndex(HttpServletRequest request, Model model) {
        List<Province> provinces = provinceService.findAll();
        model.addAttribute("provinces", provinces);
        if (request.getParameter("edit") != null) {
            model.addAttribute("edit", true);
        }
        return BRANCH_PATH + "mybranch.jsp";
    }

    @PostMapping("/managemybranch")
    public void addOrEditMyBranch(@ModelAttribute("branch") Branch branch, HttpSession session, HttpServletRequest request, HttpServletResponse response) throws IOException {
        int branchNo = ((BranchUser) (session.getAttribute("branchUser"))).getBranchNo();
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
