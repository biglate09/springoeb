package com.springoeb.employee;

import com.springoeb.employee.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by bighead on 6/9/17.
 */
@Controller
public class EmployeeController {
    @Autowired
    private EmployeeService employeeService;

    @RequestMapping("/employee/index")
    public String toEmployeeIndex(Model model){
        model.addAttribute("employees",employeeService.getAll());
        return "empindex";
    }
}