package com.springoeb.employee.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.springoeb.employee.model.*;
import com.springoeb.employee.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

/**
 * Created by bighead on 6/9/17.
 */
@RequestMapping("/employee")
@Controller
public class EmployeeController {
    @Autowired
    private EmployeeService employeeService;
    @Autowired
    private EmployeePositionService employeePositionService;
    @Autowired
    private EmployeePayService employeePayService;
    @Autowired
    private EmployeeTableService employeeTableService;
    @Autowired
    private WorkHistoryService workHistoryService;

    @RequestMapping("/index")
    public String toEmployeeIndex(Model model, HttpSession session) {
        Branch b = (Branch) session.getAttribute("branch");
        int branchNo = b.getBranchNo();
        List<Employee> employees = employeeService.findByBranchNo(branchNo);
        model.addAttribute("employees", employees);
        return "/WEB-INF/empindex.jsp";
    }

    @PostMapping("/manageemployee")
    public void addAndEditEmployee(@ModelAttribute("employee") Employee employee, HttpSession session, Model model,HttpServletResponse res) throws IOException {
        Branch b = (Branch) session.getAttribute("branch");
        int branchNo = b.getBranchNo();
        employee.setBranchNo(branchNo);
//        boolean isDuplicate = employeeService.chkDuplicateEmpName(employee.getEmpName(), branchNo);
//        if (!isDuplicate) {
        employeeService.save(employee);
//        }
        res.sendRedirect("/employee/index");
    }

    @Transactional
    @GetMapping("/deleteemployee/{empNo}")
    public void delEmployee(@PathVariable("empNo") int empNo, HttpSession session,HttpServletResponse res) throws IOException {
        Branch b = (Branch) session.getAttribute("branch");
        int branchNo = b.getBranchNo();
        employeeService.removeByEmpNoAndBranchNo(empNo, branchNo);
        res.sendRedirect("/employee/index");
    }

    @GetMapping("/ajax/getemployee/{empNo}")
    @ResponseBody
    public String getEmployee(@PathVariable("empNo") int empNo, HttpSession session) throws JsonProcessingException {
        Branch b = (Branch) session.getAttribute("branch");
        int branchNo = b.getBranchNo();
        Employee employee = employeeService.findByEmpNoAndBranchNo(empNo, branchNo);
        ObjectMapper mapper = new ObjectMapper();
        String json = mapper.writeValueAsString(employee);
        return json;
    }

    //----------------------------------------------------------------------------------------------------------//

    @RequestMapping("/position")
    public String toEmployeePositionIndex(Model model) {
        List<EmployeePosition> employeePositions = employeePositionService.findAll();
        model.addAttribute("employeePositions", employeePositions);
        return "/WEB-INF/emppos.jsp";
    }

    @PostMapping("/manageemployeeposition")
    public void addAndEditPosition(@ModelAttribute("employeePosition") EmployeePosition employeePosition,HttpServletResponse res) throws IOException {
        employeePositionService.save(employeePosition);
        res.sendRedirect("/employee/position");
    }

    @Transactional
    @GetMapping("/deleteemployeeposition/{empPosNo}")
    public void removeByEmpPosNo(@PathVariable("empPosNo") int empPosNo,HttpServletResponse res) throws IOException {
        employeePositionService.removeByEmpPosNo(empPosNo);
        res.sendRedirect("/employee/position");
    }

    @GetMapping("/ajax/getemployeeposition/{empPosNo}")
    @ResponseBody
    public String getEmployee(@PathVariable("empPosNo") int empPosNo) throws JsonProcessingException {
        EmployeePosition employeePosition = employeePositionService.findByEmpPosNo(empPosNo);
        ObjectMapper mapper = new ObjectMapper();
        String json = mapper.writeValueAsString(employeePosition);
        return json;
    }

    //----------------------------------------------------------------------------------------------------------//

    @RequestMapping("/workhistory")
    public String toEmployeeWorkHistory(Model model,HttpSession session) {
        Branch b = (Branch)session.getAttribute("branch");
        int branchNo = b.getBranchNo();
        List<WorkHistory> workHistories = workHistoryService.findAll(branchNo);
        List<Employee> employees = employeeService.findByBranchNo(branchNo);
        model.addAttribute("workHistories",workHistories);
        model.addAttribute("employees",employees);
        return "/WEB-INF/empworkhist.jsp";
    }

    @GetMapping("/manageworkhistory")
    public void save(@ModelAttribute("workHistory") WorkHistory workHistory,HttpServletResponse res) throws IOException {
        workHistoryService.save(workHistory);
        res.sendRedirect("/employee/workhistory");
    }

    @Transactional
    @GetMapping("/deleteworkhistory/{workHistNo}")
    public void removeByWorkHistNo(@PathVariable("workHistNo") int workHistNo,HttpServletResponse res,HttpSession session) throws IOException {
        Branch b = (Branch)session.getAttribute("branch");
        int branchNo = b.getBranchNo();
        workHistoryService.removeByWorkHist(workHistNo,branchNo);
        res.sendRedirect("/employee/workhistory");
    }

    //----------------------------------------------------------------------------------------------------------//

    @RequestMapping("/pay")
    public String toEmployeePayIndex(Model model) {
        List<EmployeePay> employeePays = employeePayService.findAll();
        model.addAttribute(employeePays);
        return "/WEB-INF/emppay";
    }

    @RequestMapping("/table")
    public String toEmployeeTable(Model model) {
        List<EmployeeTable> employeeTables = employeeTableService.findAll();
        model.addAttribute(employeeTables);
        return "/WEB-INF/emptable";
    }

    @RequestMapping("/check")
    public String toEmployeeCheck(Model model) {
        //เอาพนักงานทั้งหมดเฉพาะวันนี้ ช่วงเวลานี้
        List<EmployeePosition> employeePositions = employeePositionService.findAll();

        model.addAttribute(employeePositions);
        return "/WEB-INF/empcheck";
    }
}