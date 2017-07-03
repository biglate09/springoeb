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
import java.sql.Time;
import java.text.ParseException;
import java.time.LocalTime;
import java.util.ArrayList;
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
        int branchNo = (Integer) (session.getAttribute("branchno"));
        List<Employee> employees = employeeService.findByBranchNo(branchNo);
        model.addAttribute("employees", employees);
        return "/WEB-INF/empindex.jsp";
    }

    @PostMapping("/manageemployee")
    public void addAndEditEmployee(@ModelAttribute("employee") Employee employee, HttpSession session, HttpServletRequest request, HttpServletResponse response) throws IOException {
        int branchNo = (Integer) (session.getAttribute("branchno"));
        employee.setBranchNo(branchNo);
        employeeService.save(employee);
        response.sendRedirect(request.getContextPath() + "/employee/index");
    }

    @Transactional
    @GetMapping("/deleteemployee/{empNo}")
    public void delEmployee(@PathVariable("empNo") int empNo, HttpSession session, HttpServletRequest request, HttpServletResponse response) throws IOException {
        int branchNo = (Integer) (session.getAttribute("branchno"));
        employeeService.removeByEmpNoAndBranchNo(empNo, branchNo);
        response.sendRedirect(request.getContextPath() + "/employee/index");
    }

    @GetMapping("/ajax/getemployee/{empNo}")
    @ResponseBody
    public String getEmployee(@PathVariable("empNo") int empNo, HttpSession session) throws JsonProcessingException {
        int branchNo = (Integer) (session.getAttribute("branchno"));
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
    public void addAndEditPosition(@ModelAttribute("employeePosition") EmployeePosition employeePosition, HttpServletRequest request, HttpServletResponse response) throws IOException {
        employeePositionService.save(employeePosition);
        response.sendRedirect(request.getContextPath() + "/employee/position");
    }

    @Transactional
    @GetMapping("/deleteemployeeposition/{empPosNo}")
    public void removeByEmpPosNo(@PathVariable("empPosNo") int empPosNo, HttpServletRequest request, HttpServletResponse response) throws IOException {
        employeePositionService.removeByEmpPosNo(empPosNo);
        response.sendRedirect(request.getContextPath() + "/employee/position");
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
    public String toEmployeeWorkHistory(Model model, HttpSession session) {
        int branchNo = (Integer) (session.getAttribute("branchno"));
        List<WorkHistory> workHistories = workHistoryService.findAll(branchNo);
        List<Employee> employees = employeeService.findByBranchNo(branchNo);
        model.addAttribute("workHistories", workHistories);
        model.addAttribute("employees", employees);
        return "/WEB-INF/empworkhist.jsp";
    }

    @PostMapping("/manageworkhistory")
    public void save(HttpServletResponse response, HttpServletRequest request, HttpSession session) throws IOException, ParseException {
        int branchNo = (Integer) (session.getAttribute("branchno"));
        List<WorkHistory> workHistories = new ArrayList<WorkHistory>();
        String stWorkDate = request.getParameter("workDate");
        String stEmpNos[] = request.getParameterValues("empNo");
        String stWorkHours[] = request.getParameterValues("workHour");
        String stWorkMinutes[] = request.getParameterValues("workMin");

        Date workDate = Date.valueOf(stWorkDate);

        for (int i = 0; i < stEmpNos.length; i++) {
            int empNo = Integer.parseInt(stEmpNos[i]);
            WorkHistory workHistory = new WorkHistory();
            Employee employee = employeeService.findByEmpNoAndBranchNo(empNo, branchNo);
            String payType = employee.getPayType();
            double pay = employee.getPay();
            int workHour = Integer.parseInt(stWorkHours[i]);
            int workMinute = Integer.parseInt(stWorkMinutes[i]);
            double sumWorkHour = workHour + (workMinute * 5 / 300.0);
            if (payType.equals(Employee.HOUR)) {
                pay = pay * sumWorkHour;
            }

            workHistory.setEmpNo(empNo);
            workHistory.setWorkHour(workHour);
            workHistory.setWorkMin(workMinute);
            workHistory.setWorkDate(workDate);
            workHistory.setWorkPay(pay);
            workHistories.add(workHistory);
        }

        Iterable<WorkHistory> iWorkHistories = workHistories;

        workHistoryService.save(iWorkHistories);
        response.sendRedirect(request.getContextPath() + "/employee/workhistory");
    }

    @Transactional
    @GetMapping("/deleteworkhistory/{workHistNo}")
    public void removeByWorkHistNo(@PathVariable("workHistNo") int workHistNo, HttpServletResponse response, HttpServletRequest request, HttpSession session) throws IOException {
        int branchNo = (Integer) (session.getAttribute("branchno"));
        workHistoryService.removeByWorkHist(workHistNo, branchNo);
        response.sendRedirect(request.getContextPath() + "/employee/workhistory");
    }

    //----------------------------------------------------------------------------------------------------------//

    @RequestMapping("/pay")
    public String toEmployeePayIndex(Model model, HttpSession session) {
        int branchNo = (Integer) (session.getAttribute("branchno"));
        List<Employee> employees = employeeService.findByBranchNo(branchNo);
        model.addAttribute("employees", employees);
        return "/WEB-INF/emppaid.jsp";
    }

    @GetMapping("/pay/{empNo}")
    public void pay(@PathVariable("empNo") int empNo, Model model, HttpServletRequest request, HttpServletResponse response) throws IOException {
        double pay = Double.parseDouble(request.getParameter("pay"));
        EmployeePay employeePay = new EmployeePay();
        employeePay.setPay(pay);
        employeePay.setEmpNo(empNo);
        employeePayService.save(employeePay);
        response.sendRedirect(request.getContextPath() + "/employee/pay");
    }

    //----------------------------------------------------------------------------------------------------------//

    @RequestMapping("/table")
    public String toEmployeeTable(Model model, HttpSession session) {
        int branchNo = (Integer) (session.getAttribute("branchno"));
        List<EmployeeTable> employeeTables = employeeTableService.findAll(branchNo);
        List<Employee> employees = employeeService.findByBranchNo(branchNo);
        List<EmployeePosition> employeePositions = employeePositionService.findAll();
        model.addAttribute("employees", employees);
        model.addAttribute("employeePositions", employeePositions);
        model.addAttribute("employeeTables", employeeTables);
        return "/WEB-INF/emptable.jsp";
    }

    @RequestMapping("/managetable")
    public void save(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Date date = Date.valueOf(request.getParameter("date"));
        String[] stEmpTimeNo = request.getParameterValues("empTimeNo");
        String[] stEmpNo = request.getParameterValues("empNo");
        String[] stEmpPosNo = request.getParameterValues("empPosNo");
        String[] stTimeStart = request.getParameterValues("timeStart");
        String[] stTimeEnd = request.getParameterValues("timeEnd");
        List<EmployeeTable> employeeTables = new ArrayList<EmployeeTable>();
        for (int i = 0; i < stEmpNo.length; i++) {
            EmployeeTable employeeTable = new EmployeeTable();
            int empNo = Integer.parseInt(stEmpNo[i]);
            int empPosNo = Integer.parseInt(stEmpPosNo[i]);
            Time timeStart = Time.valueOf(stTimeStart[i] + ":00");
            Time timeEnd = Time.valueOf(stTimeEnd[i] + ":00");
            if(stEmpTimeNo != null){
                employeeTable.setEmpTimeNo(Integer.parseInt(stEmpTimeNo[i]));
            }
            employeeTable.setDate(date);
            employeeTable.setEmpNo(empNo);
            employeeTable.setEmpPosNo(empPosNo);
            employeeTable.setTimeStart(timeStart);
            employeeTable.setTimeEnd(timeEnd);
            employeeTables.add(employeeTable);
        }
        Iterable<EmployeeTable> iEmployeeTables = employeeTables;
        employeeTableService.save(iEmployeeTables);
        response.sendRedirect(request.getContextPath() + "/employee/table");
    }

    @Transactional
    @RequestMapping("/deletetable/{empTimeNo}")
    public void removeByEmpTimeNo(@PathVariable("empTimeNo") int empTimeNo,HttpServletRequest request,HttpServletResponse response,HttpSession session) throws IOException {
        int branchNo = (Integer)(session.getAttribute("branchno"));
        employeeTableService.removeByEmpTimeNoAndBranchNo(empTimeNo, branchNo);
        response.sendRedirect(request.getContextPath() + "/employee/table");
    }

    //----------------------------------------------------------------------------------------------------------//

    @RequestMapping("/check")
    public String toEmployeeCheck(Model model, HttpSession session) {
        int branchNo = (Integer) (session.getAttribute("branchno"));
        Date date = new Date(System.currentTimeMillis());
        Time time = new Time(System.currentTimeMillis());
        List<EmployeeTable> employeeTables = employeeTableService.findEmployeeTableNow(branchNo, date, time);
        model.addAttribute("employeeTables", employeeTables);
        return "/WEB-INF/empcheck.jsp";
    }

    @RequestMapping("/clockin")
    public void clockIn(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int empNo = Integer.parseInt(request.getParameter("empNo"));
        int empTimeNo = Integer.parseInt(request.getParameter("empTimeNo"));
        Date date = new Date(System.currentTimeMillis());
        Time workStart = new Time(System.currentTimeMillis());
        WorkHistory workHistory = new WorkHistory();
        workHistory.setWorkDate(date);
        workHistory.setWorkStart(workStart);
        workHistory.setEmpNo(empNo);
        workHistory.setEmpTimeNo(empTimeNo);
        workHistoryService.save(workHistory);
        response.sendRedirect(request.getContextPath() + "/employee/check");
    }

    @RequestMapping("/clockout")
    public void clockOut(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int workHistNo = Integer.parseInt(request.getParameter("workHistNo"));
        WorkHistory workHistory = workHistoryService.findByWorkHistNo(workHistNo);
        Employee employee = workHistory.getEmployee();

        Time workStart = workHistory.getWorkStart();
        Time workEnd = new Time(System.currentTimeMillis());

        LocalTime localWorkStart = workStart.toLocalTime();
        LocalTime localWorkEnd = workEnd.toLocalTime();

        int hourStart = localWorkStart.getHour();
        int minStart = localWorkStart.getMinute();
        int hourEnd = localWorkEnd.getHour();
        int minEnd = localWorkEnd.getMinute();

        int hour = 0,minute = 0;

        if(minEnd < minStart){
            hour = hourEnd - hourStart - 1;
            minute = (60 - minStart) + minEnd;
        }else{
            hour = hourEnd - hourStart;
            minute = minEnd - minStart;
        }


        double workPay = employee.getPay();
        if (employee.getPayType().equals(Employee.HOUR)) {
            workPay = workPay * ( hour + ((minute*5)/300d) );
        }

        workHistory.setWorkEnd(workEnd);
        workHistory.setWorkPay(workPay);
        workHistory.setWorkHour(hour);
        workHistory.setWorkMin(minute);

        workHistoryService.save(workHistory);

        response.sendRedirect(request.getContextPath() + "/employee/check");
    }
}