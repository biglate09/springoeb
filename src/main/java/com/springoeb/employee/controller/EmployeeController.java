package com.springoeb.employee.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.springoeb.employee.model.*;
import com.springoeb.employee.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;
import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Enumeration;
import java.util.List;

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
        int branchNo = (Integer)(session.getAttribute("branchno"));
        List<Employee> employees = employeeService.findByBranchNo(branchNo);
        model.addAttribute("employees", employees);
        return "/WEB-INF/empindex.jsp";
    }

    @PostMapping("/manageemployee")
    public void addAndEditEmployee(@ModelAttribute("employee") Employee employee, HttpSession session, HttpServletRequest request,HttpServletResponse response) throws IOException {
        int branchNo = (Integer)(session.getAttribute("branchno"));
        employee.setBranchNo(branchNo);
        employeeService.save(employee);
        response.sendRedirect(request.getContextPath()+"/employee/index");
    }

    @Transactional
    @GetMapping("/deleteemployee/{empNo}")
    public void delEmployee(@PathVariable("empNo") int empNo, HttpSession session,HttpServletRequest request,HttpServletResponse response) throws IOException {
        int branchNo = (Integer)(session.getAttribute("branchno"));
        employeeService.removeByEmpNoAndBranchNo(empNo, branchNo);
        response.sendRedirect(request.getContextPath()+"/employee/index");
    }

    @GetMapping("/ajax/getemployee/{empNo}")
    @ResponseBody
    public String getEmployee(@PathVariable("empNo") int empNo, HttpSession session) throws JsonProcessingException {
        int branchNo = (Integer)(session.getAttribute("branchno"));
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
    public void addAndEditPosition(@ModelAttribute("employeePosition") EmployeePosition employeePosition,HttpServletRequest request,HttpServletResponse response) throws IOException {
        employeePositionService.save(employeePosition);
        response.sendRedirect(request.getContextPath()+"/employee/position");
    }

    @Transactional
    @GetMapping("/deleteemployeeposition/{empPosNo}")
    public void removeByEmpPosNo(@PathVariable("empPosNo") int empPosNo,HttpServletRequest request,HttpServletResponse response) throws IOException {
        employeePositionService.removeByEmpPosNo(empPosNo);
        response.sendRedirect(request.getContextPath()+"/employee/position");
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
        int branchNo = (Integer)(session.getAttribute("branchno"));
        List<WorkHistory> workHistories = workHistoryService.findAll(branchNo);
        List<Employee> employees = employeeService.findByBranchNo(branchNo);
        model.addAttribute("workHistories",workHistories);
        model.addAttribute("employees",employees);
        return "/WEB-INF/empworkhist.jsp";
    }

    @PostMapping("/manageworkhistory")
    public void save(@ModelAttribute("workHistory") WorkHistory workHistory, HttpServletResponse response,HttpServletRequest request,HttpSession session) throws IOException, ParseException {
        int branchNo = (Integer)(session.getAttribute("branchno"));
        int empNo = workHistory.getEmpNo();
        Employee employee = employeeService.findByEmpNoAndBranchNo(empNo,branchNo);
        String payType = employee.getPayType();
        double pay = employee.getPay();
        double workHour = Double.parseDouble(request.getParameter("workHour"));
        double workMinute = Double.parseDouble(request.getParameter("workMinute"));
        double sumWorkHour = workHour + (workMinute*5/300);
        if(payType.equals(Employee.HOUR)){
            pay = pay * sumWorkHour;
        }
        workHistory.setWorkHour(sumWorkHour);
        workHistory.setWorkPay(pay);
        workHistoryService.save(workHistory);

        response.sendRedirect(request.getContextPath()+"/employee/workhistory");
    }

    @Transactional
    @GetMapping("/deleteworkhistory/{workHistNo}")
    public void removeByWorkHistNo(@PathVariable("workHistNo") int workHistNo,HttpServletResponse response,HttpServletRequest request,HttpSession session) throws IOException {
        int branchNo = (Integer)(session.getAttribute("branchno"));
        workHistoryService.removeByWorkHist(workHistNo,branchNo);
        response.sendRedirect(request.getContextPath()+"/employee/workhistory");
    }

    //----------------------------------------------------------------------------------------------------------//

    @RequestMapping("/pay")
    public String toEmployeePayIndex(Model model,HttpSession session) {
        int branchNo = (Integer)(session.getAttribute("branchno"));
        List<Employee> employees = employeeService.findByBranchNo(branchNo);
        model.addAttribute("employees",employees);
        return "/WEB-INF/emppaid.jsp";
    }

    @GetMapping("/pay/{empNo}")
    public void pay(@PathVariable("empNo") int empNo, Model model,HttpServletRequest request,HttpServletResponse response) throws IOException {
        double pay = Double.parseDouble(request.getParameter("pay"));
        EmployeePay employeePay = new EmployeePay();
        employeePay.setPay(pay);
        employeePay.setEmpNo(empNo);
        employeePayService.save(employeePay);
        response.sendRedirect(request.getContextPath()+"/employee/pay");
    }

    //----------------------------------------------------------------------------------------------------------//

    @RequestMapping("/table")
    public String toEmployeeTable(Model model) {
        List<EmployeeTable> employeeTables = employeeTableService.findAll();
        model.addAttribute(employeeTables);
        return "/WEB-INF/emptable.jsp";
    }

    //----------------------------------------------------------------------------------------------------------//

    @RequestMapping("/check")
    public String toEmployeeCheck(Model model) {
        //เอาพนักงานทั้งหมดเฉพาะวันนี้ ช่วงเวลานี้
        List<EmployeePosition> employeePositions = employeePositionService.findAll();

        model.addAttribute(employeePositions);
        return "/WEB-INF/empcheck";
    }
}