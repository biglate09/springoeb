package com.springoeb;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
public class MainController {
    @RequestMapping("/")
    public String index(){
        return "index.jsp";
    }

    @GetMapping("/loginpage")
    public String toLoginPage(HttpServletRequest request, Model model){
        String username = request.getParameter("username");
        model.addAttribute("username",username);
        return "login.jsp";
    }
}
