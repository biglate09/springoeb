package com.springoeb.system.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.springoeb.system.model.BranchUser;
import com.springoeb.system.model.District;
import com.springoeb.system.model.Province;
import com.springoeb.system.model.SubDistrict;
import com.springoeb.system.service.BranchUserService;
import com.springoeb.system.service.DistrictService;
import com.springoeb.system.service.ProvinceService;
import com.springoeb.system.service.SubDistrictService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/system")
public class ManageController {
    @Autowired
    private BranchUserService branchUserService;
    @Autowired
    private ProvinceService provinceService;
    @Autowired
    private DistrictService districtService;
    @Autowired
    private SubDistrictService subDistrictService;

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

    //------------------------------------------------------------------------------------//

    @PutMapping("/getprovince/{province}")
    @ResponseBody
    public String getProvince(@PathVariable("province") int provinceNo) throws JsonProcessingException {
        Province province = provinceService.findByProvinceNo(provinceNo);
        ObjectMapper mapper = new ObjectMapper();
        String json = mapper.writeValueAsString(province);
        return json;
    }

    @PutMapping("/getdistrict/{district}")
    @ResponseBody
    public String getDistrict(@PathVariable("district") int districtNo) throws JsonProcessingException {
        District district = districtService.findByDistrictNo(districtNo);
        ObjectMapper mapper = new ObjectMapper();
        String json = mapper.writeValueAsString(district);
        return json;
    }

    @PutMapping("/getsubDistrict/{subdistrict}")
    @ResponseBody
    public String getSubDistrict(@PathVariable("subdistrict") int subDistrictNo) throws JsonProcessingException {
        SubDistrict subDistrict = subDistrictService.findBySubDistrictNo(subDistrictNo);
        ObjectMapper mapper = new ObjectMapper();
        String json = mapper.writeValueAsString(subDistrict);
        return json;
    }
}
