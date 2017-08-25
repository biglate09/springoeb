package com.springoeb.system.controller;

import com.springoeb.system.model.BranchUser;
import com.springoeb.system.service.BranchUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/system")
public class ManageController {
    @Autowired
    private BranchUserService branchUserService;

    @PostMapping("/login")
    public String login(@ModelAttribute("branchUser") BranchUser branchUser, HttpServletRequest request, HttpServletResponse response, HttpSession session, Model model) {
        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
        String target = "/login.jsp";
        BranchUser branchUserResult = branchUserService.findByUsername(branchUser.getUsername());
        boolean login_pass = false;

        if (branchUserResult != null) {
            login_pass = encoder.matches(branchUser.getPassword(), branchUserResult.getPassword());
            if (login_pass) {
                session.setAttribute("branchUser", branchUserResult);
                target = "/";

                if(request.getParameter("remember-me") != null){
                    Cookie cookie = new Cookie("username",branchUserResult.getUsername());
                    cookie.setPath(request.getContextPath());
                    cookie.setMaxAge(Integer.MAX_VALUE);
                    response.addCookie(cookie);
                }
            }
        }

        if(!login_pass){
            model.addAttribute("username",branchUser.getUsername());
            model.addAttribute("msg","ชื่อผู้ใช้หรือรหัสผ่านไม่ถูกต้อง กรุณาลองใหม่อีกครั้ง");
            if(request.getParameter("remember-me") != null) {
                model.addAttribute("rememberme", true);
            }
        }

        return target;
    }

    @GetMapping("/logout")
    public String logout(HttpSession session,HttpServletRequest request,HttpServletResponse response){
        String target = "/login.jsp";
        session.invalidate();
        Cookie cookie = new Cookie("username",null);
        cookie.setPath(request.getContextPath());
        cookie.setMaxAge(0);
        response.addCookie(cookie);
        return target;
    }
}