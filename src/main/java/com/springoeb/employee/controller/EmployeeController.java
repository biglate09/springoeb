package com.springoeb.employee.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.springoeb.employee.model.*;
import com.springoeb.employee.service.*;
import com.springoeb.system.model.BranchUser;
import com.springoeb.system.service.EmailService;
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
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.sql.Date;
import java.sql.Time;
import java.text.ParseException;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

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
    @Autowired
    private EmailService emailService;

    private final String EMP_PATH = "/WEB-INF/employee/";

    @RequestMapping("/index")
    public String toEmployeeIndex() {
        return EMP_PATH + "empindex.jsp";
    }

    @Transactional
    @PostMapping("/manageemployee")
    public void addAndEditEmployee(@ModelAttribute("employee") Employee employee, HttpSession session, HttpServletRequest request, HttpServletResponse response) throws Exception {
        int branchNo = ((BranchUser)(session.getAttribute("branchUser"))).getBranchNo();
        employee.setBranchNo(branchNo);
        boolean isAdd = (employee.getEmpNo() == null);
        boolean isDuplicate = true;
        if (!employeeService.chkDuplicateEmpName(employee.getEmpName(), branchNo)) {
            isDuplicate = false;
        } else {
            if (employee.getEmpNo() != null && employeeService.findByEmpNoAndBranchNo(employee.getEmpNo(), branchNo).getEmpName().equals(employee.getEmpName())) {
                isDuplicate = false;
            } else {
                throw new Exception();
            }
        }

        if(!isDuplicate) {
            employee.setAdmin(Boolean.parseBoolean(request.getParameter("isAdmin")));
            employee = employeeService.save(employee);
            if (isAdd) {
                String subject = "[ระบบ OrderEatBill] ตั้งค่าการลงชื่อเข้าใช้ระบบใบฐานะ" + (employee.isAdmin() ? "แอดมิน" : "พนักงานร้านอาหาร");
                String token = getBcrypt(employee.getEmpNo() + "|" + employee.getEmpName() + "|" + employee.getEmail());
                String msg = "กรุณาคลิกลิงก์ด้านล่างเพื่อสร้าง บัญชีผู้ใช้ในการใช้งานระบบ\n" +
                        "ตำแหน่ง : " + (employee.isAdmin() ? "แอดมินของสาขา " : "พนักงานร้านอาหารของสาขา ") + ((BranchUser)(session.getAttribute("branchUser"))).getBranch().getBranchName() + "\n" +
                        "ชื่อ : " + employee.getEmpName() + "\n" +
                        request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/system/registeremp?apiKey=" + URLEncoder.encode(token, "UTF-8");
                emailService.sendMail(employee.getEmail(), subject, msg);
            }
        }
    }

    private String getBcrypt(String username){
        BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();
        return bCryptPasswordEncoder.encode(username);
    }

    @Transactional
    @PostMapping("/confirmresent/{empNo}")
    @ResponseBody
    public String confirmResent(@PathVariable("empNo") int empNo,HttpSession session) throws JsonProcessingException {
        int branchNo = ((BranchUser)(session.getAttribute("branchUser"))).getBranchNo();
        Employee employee = employeeService.findByEmpNoAndBranchNo(empNo,branchNo);
        ObjectMapper mapper = new ObjectMapper();
        String json = mapper.writeValueAsString(employee);
        return json;
    }

    @PostMapping("/resent")
    @ResponseBody
    public void resent(HttpServletRequest request, HttpSession session) throws UnsupportedEncodingException {
        String email = request.getParameter("email");
        int branchNo = ((BranchUser)(session.getAttribute("branchUser"))).getBranchNo();
        int empNo = Integer.parseInt(request.getParameter("empNo"));
        Employee employee = employeeService.findByEmpNoAndBranchNo(empNo,branchNo);
        employee.setEmail(email);
        employee = employeeService.save(employee);
        String subject = "[ระบบ OrderEatBill] ตั้งค่าการลงชื่อเข้าใช้ระบบใบฐานะ" + (employee.isAdmin() ? "แอดมิน" : "พนักงานร้านอาหาร");
        String token = getBcrypt(employee.getEmpNo() + "|" + employee.getEmpName() + "|" + employee.getEmail());
        String msg = "กรุณาคลิกลิงก์ด้านล่างเพื่อสร้าง บัญชีผู้ใช้ในการใช้งานระบบ\n" +
                "ตำแหน่ง : " + (employee.isAdmin() ? "แอดมินของสาขา " : "พนักงานร้านอาหารของสาขา ") + ((BranchUser)(session.getAttribute("branchUser"))).getBranch().getBranchName() + "\n" +
                "ชื่อ : " + employee.getEmpName() + "\n" +
                request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/system/registeremp?apiKey=" + URLEncoder.encode(token, "UTF-8");
        emailService.sendMail(employee.getEmail(), subject, msg);
    }

    @Transactional
    @GetMapping("/deleteemployee/{empNo}")
    public void delEmployee(@PathVariable("empNo") int empNo, HttpSession session, HttpServletRequest request, HttpServletResponse response) throws IOException {
        int branchNo = ((BranchUser)(session.getAttribute("branchUser"))).getBranchNo();
        employeeService.removeByEmpNoAndBranchNo(empNo, branchNo);
    }

    @GetMapping("/ajax/getemployee/{empNo}")
    @ResponseBody
    public String getEmployee(@PathVariable("empNo") int empNo, HttpSession session) throws JsonProcessingException {
        int branchNo = ((BranchUser)(session.getAttribute("branchUser"))).getBranchNo();
        Employee employee = employeeService.findByEmpNoAndBranchNo(empNo, branchNo);
        ObjectMapper mapper = new ObjectMapper();
        String json = mapper.writeValueAsString(employee);
        return json;
    }

    @PostMapping("/ajax/getemployees")
    @ResponseBody
    public String getJsonEmployees(HttpSession session) throws JsonProcessingException {
        int branchNo = ((BranchUser)(session.getAttribute("branchUser"))).getBranchNo();
        List<Employee> employee = employeeService.findByBranchNo(branchNo);
        ObjectMapper mapper = new ObjectMapper();
        String json = mapper.writeValueAsString(employee);
        return json;
    }

    //----------------------------------------------------------------------------------------------------------//

    @RequestMapping("/position")
    public String toEmployeePositionIndex() {
        return EMP_PATH + "emppos.jsp";
    }

    @PostMapping("/manageemployeeposition")
    public void addAndEditPosition(@ModelAttribute("employeePosition") EmployeePosition employeePosition, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
        int branchNo = ((BranchUser)(session.getAttribute("branchUser"))).getBranchNo();
        if (!employeePositionService.chkDuplicateEmpPosisitonName(employeePosition.getEmpPosName())) {
            employeePositionService.save(employeePosition);
        } else {
            throw new Exception();
        }
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

    @PostMapping("/ajax/getemployeepositions")
    @ResponseBody
    public String getJsonEmployeePositions(HttpSession session) throws JsonProcessingException {
        List<EmployeePosition> employeePositions = employeePositionService.findAll();
        ObjectMapper mapper = new ObjectMapper();
        String json = mapper.writeValueAsString(employeePositions);
        return json;
    }

    //----------------------------------------------------------------------------------------------------------//

    @RequestMapping("/workhistory")
    public String toEmployeeWorkHistory(Model model, HttpSession session) {
        int branchNo = ((BranchUser)(session.getAttribute("branchUser"))).getBranchNo();
        List<Employee> employees = employeeService.findByBranchNo(branchNo);
        model.addAttribute("employees", employees);
        return EMP_PATH + "empworkhist.jsp";
    }

    @PostMapping("/manageworkhistory")
    public void save(HttpServletResponse response, HttpServletRequest request, HttpSession session) throws IOException, ParseException {
        int branchNo = ((BranchUser)(session.getAttribute("branchUser"))).getBranchNo();
        List<WorkHistory> workHistories = new ArrayList<WorkHistory>();
        String stWorkDate = request.getParameter("workDate");
        String stEmpNos[] = request.getParameterValues("empNo");
        String stWorkHours[] = request.getParameterValues("workHour");
        String stWorkMinutes[] = request.getParameterValues("workMin");
        String stWorkHistNo = request.getParameter("workHistNo");
        Integer workHistNo = stWorkHistNo == null ? null : Integer.parseInt(stWorkHistNo);
        Date workDate = Date.valueOf(stWorkDate);

        for (int i = 0; i < stEmpNos.length; i++) {
            int empNo = Integer.parseInt(stEmpNos[i]);
            WorkHistory workHistory = new WorkHistory();
            Employee employee = employeeService.findByEmpNoAndBranchNo(empNo, branchNo);
            String payType = employee.getPayType();
            double pay = employee.getPay();
            int workHour = 0;
            int workMinute = 0;
            if(stWorkHours[i] != null && !stWorkHours[i].equals("")){
                workHour = Integer.parseInt(stWorkHours[i]);
            }
            if (stWorkMinutes[i] != null && !stWorkMinutes[i].equals("")) {
                workMinute = Integer.parseInt(stWorkMinutes[i]);
            }

            double sumWorkHour = workHour + (workMinute * 5 / 300.0);
            if (payType.equals(Employee.HOUR)) {
                pay = pay * sumWorkHour;
            }

            workHistory.setEmpNo(empNo);
            workHistory.setWorkHour(workHour);
            workHistory.setWorkMin(workMinute);
            workHistory.setWorkDate(workDate);
            workHistory.setWorkPay(pay);
            if (workHistNo != null) {
                workHistory.setWorkHistNo(workHistNo);
            }
            workHistories.add(workHistory);
        }

        Iterable<WorkHistory> iWorkHistories = workHistories;

        workHistoryService.save(iWorkHistories);
        response.sendRedirect(request.getContextPath() + "/employee/workhistory");
    }

    @Transactional
    @GetMapping("/deleteworkhistory/{workHistNo}")
    public void removeByWorkHistNo(@PathVariable("workHistNo") int workHistNo, HttpServletResponse response, HttpServletRequest request, HttpSession session) throws IOException {
        int branchNo = ((BranchUser)(session.getAttribute("branchUser"))).getBranchNo();
        workHistoryService.removeByWorkHist(workHistNo, branchNo);
        response.sendRedirect(request.getContextPath() + "/employee/workhistory");
    }

    @PostMapping("/ajax/getworkhistories")
    @ResponseBody
    public String getJsonWorkHistories(HttpSession session) throws JsonProcessingException {
        int branchNo = ((BranchUser)(session.getAttribute("branchUser"))).getBranchNo();
        List<WorkHistory> workHistories = workHistoryService.findAll(branchNo);
        for (WorkHistory wh : workHistories) {
            wh.setEmpName(wh.getEmployee().getEmpName());
        }
        ObjectMapper mapper = new ObjectMapper();
        String json = mapper.writeValueAsString(workHistories);
        return json;
    }

    @GetMapping("/ajax/getworkhistory/{workHistNo}")
    @ResponseBody
    public String getJsonWorkHistories(@PathVariable("workHistNo") int workHistNo, HttpSession session) throws JsonProcessingException {
        int branchNo = ((BranchUser)(session.getAttribute("branchUser"))).getBranchNo();
        WorkHistory workHistory = workHistoryService.getWorkHistory(workHistNo, branchNo);
        ObjectMapper mapper = new ObjectMapper();
        String json = mapper.writeValueAsString(workHistory);
        return json;
    }

    @PostMapping("/ajax/smartgenworkhistory")
    @ResponseBody
    public String smartGenWorkHistory(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws JsonProcessingException {
        int branchNo = ((BranchUser)(session.getAttribute("branchUser"))).getBranchNo();
        Date d = Date.valueOf(request.getParameter("date"));
        List<WorkHistory> workHistories = workHistoryService.findByWorkDate(d);
        List<EmployeeTable> employeeTables = employeeTableService.findAllByDate(d);
        Set<Integer> workEmpNo = new HashSet<Integer>();
        Set<Integer> tableEmpNo = new HashSet<Integer>();

        for (WorkHistory wh : workHistories) {
            workEmpNo.add(wh.getEmpNo());
        }

        for (EmployeeTable et : employeeTables) {
            tableEmpNo.add(et.getEmpNo());
        }
        tableEmpNo.removeAll(workEmpNo);
        ObjectMapper mapper = new ObjectMapper();
        String json = mapper.writeValueAsString(tableEmpNo);
        return json;
    }

    @PostMapping("/ajax/filterworkhistory")
    @ResponseBody
    public String filterWorkByDate(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws JsonProcessingException {
        String filterDate = request.getParameter("filterdate");
        String fromddmmyyyy = filterDate.substring(0, 10);
        String toddmmyyyy = filterDate.substring(13, 23);
        Date fromDate = Date.valueOf(fromddmmyyyy.substring(6, 10) + "-" + fromddmmyyyy.substring(3, 5) + "-" + fromddmmyyyy.substring(0, 2));
        Date toDate = Date.valueOf(toddmmyyyy.substring(6, 10) + "-" + toddmmyyyy.substring(3, 5) + "-" + toddmmyyyy.substring(0, 2));
        List<WorkHistory> workHistories = workHistoryService.findByWorkDate(fromDate, toDate);
        for (WorkHistory wh : workHistories) {
            wh.setEmpName(wh.getEmployee().getEmpName());
        }
        ObjectMapper mapper = new ObjectMapper();
        String json = mapper.writeValueAsString(workHistories);
        return json;
    }
    //----------------------------------------------------------------------------------------------------------//

    @RequestMapping("/pay")
    public String toEmployeePayIndex(Model model, HttpSession session) {
        int branchNo = ((BranchUser)(session.getAttribute("branchUser"))).getBranchNo();
        List<Employee> employees = employeeService.findByBranchNo(branchNo);
        model.addAttribute("employees", employees);
        return EMP_PATH + "/emppaid.jsp";
    }

    @PostMapping("/payforemp")
    public void pay(Model model, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
        int empNo = Integer.parseInt(request.getParameter("empNo"));
        int branchNo = ((BranchUser)(session.getAttribute("branchUser"))).getBranchNo();
        double pay = Double.parseDouble(request.getParameter("pay"));
//        double remainPay = workHistoryService.getWorkSum(branchNo, empNo) - employeePayService.getPaySum(branchNo, empNo);
//        if (pay <= remainPay) {
        EmployeePay employeePay = new EmployeePay();
        employeePay.setPay(pay);
        employeePay.setEmpNo(empNo);
        employeePayService.save(employeePay);
//        } else {
//            throw new Exception();
//        }
    }

    //----------------------------------------------------------------------------------------------------------//

    @RequestMapping("/table")
    public String toEmployeeTable(Model model, HttpSession session) {
        int branchNo = ((BranchUser)(session.getAttribute("branchUser"))).getBranchNo();
        List<EmployeeTable> employeeTables = employeeTableService.findAll(branchNo);
        List<Employee> employees = employeeService.findByBranchNo(branchNo);
        List<EmployeePosition> employeePositions = employeePositionService.findAll();
        model.addAttribute("employees", employees);
        model.addAttribute("employeePositions", employeePositions);
        model.addAttribute("employeeTables", employeeTables);
        return EMP_PATH + "/emptable.jsp";
    }

    @RequestMapping("/managetable")
    public void save(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Date date = Date.valueOf(request.getParameter("date"));
        String[] stEmpTimeNo = request.getParameterValues("empTimeNo");
        String[] stEmpNo = request.getParameterValues("empNo");
        String[] stEmpPosNo = request.getParameterValues("empPosNo");
        String[] stWorkTime = request.getParameterValues("workTime"); // Kopi
        List<EmployeeTable> employeeTables = new ArrayList<EmployeeTable>();
        for (int i = 0; i < stEmpNo.length; i++) {
            EmployeeTable employeeTable = new EmployeeTable();
            int empNo = Integer.parseInt(stEmpNo[i]);
            int empPosNo = Integer.parseInt(stEmpPosNo[i]);
            Time timeStart = Time.valueOf(stWorkTime[i]); // Kopi
            Time timeEnd = Time.valueOf(stWorkTime[i]); // Kopi
            if (stEmpTimeNo != null) {
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
    public void removeByEmpTimeNo(@PathVariable("empTimeNo") int empTimeNo, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException {
        int branchNo = ((BranchUser)(session.getAttribute("branchUser"))).getBranchNo();
        employeeTableService.removeByEmpTimeNoAndBranchNo(empTimeNo, branchNo);
        response.sendRedirect(request.getContextPath() + "/employee/table");
    }

    //----------------------------------------------------------------------------------------------------------//

    @RequestMapping("/check")
    public String toEmployeeCheck(Model model, HttpSession session) {
        int branchNo = ((BranchUser)(session.getAttribute("branchUser"))).getBranchNo();
        Date date = new Date(System.currentTimeMillis());
        Time time = new Time(System.currentTimeMillis());
        List<EmployeeTable> employeeTables = employeeTableService.findEmployeeTableNow(branchNo, date);
        model.addAttribute("employeeTables", employeeTables);
        return EMP_PATH + "empcheck.jsp";
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
    public void clockOut(HttpServletRequest request, HttpServletResponse response,HttpSession session) throws IOException {
        int branchNo = ((BranchUser)(session.getAttribute("branchUser"))).getBranchNo();
        int workHistNo = Integer.parseInt(request.getParameter("workHistNo"));
        WorkHistory workHistory = workHistoryService.getWorkHistory(workHistNo,branchNo);
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