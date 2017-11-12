package com.springoeb.system.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.springoeb.branch.model.Branch;
import com.springoeb.branch.service.BranchService;
import com.springoeb.cashier.model.Bill;
import com.springoeb.cashier.model.Order;
import com.springoeb.cashier.model.OrderAddOn;
import com.springoeb.cashier.service.BillService;
import com.springoeb.cashier.service.OrderAddOnService;
import com.springoeb.cashier.service.OrderService;
import com.springoeb.employee.model.Employee;
import com.springoeb.employee.service.EmployeeService;
import com.springoeb.menu.model.BranchMenu;
import com.springoeb.menu.service.BranchMenuService;
import com.springoeb.menu.service.MenuService;
import com.springoeb.system.model.*;
import com.springoeb.system.service.BranchUserService;
import com.springoeb.system.service.DistrictService;
import com.springoeb.system.service.ProvinceService;
import com.springoeb.system.service.SubDistrictService;
import com.springoeb.table.model.Table;
import com.springoeb.table.service.TableService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.sql.Date;
import java.sql.Time;
import java.util.List;

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
    @Autowired
    private BranchService branchService;
    @Autowired
    private EmployeeService employeeService;
    @Autowired
    private BranchMenuService branchMenuService;
    @Autowired
    private BillService billService;
    @Autowired
    private TableService tableService;
    @Autowired
    private OrderService orderService;
    @Autowired
    private MenuService menuService;
    @Autowired
    private OrderAddOnService orderAddOnService;

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

                if (request.getParameter("remember-me") != null) {
                    Cookie cookie = new Cookie("username", branchUserResult.getUsername());
                    cookie.setPath(request.getContextPath());
                    cookie.setMaxAge(Integer.MAX_VALUE);
                    response.addCookie(cookie);
                }
            }
        }

        if (!login_pass) {
            model.addAttribute("username", branchUser.getUsername());
            model.addAttribute("msg", "ชื่อผู้ใช้หรือรหัสผ่านไม่ถูกต้อง กรุณาลองใหม่อีกครั้ง");
            if (request.getParameter("remember-me") != null) {
                model.addAttribute("rememberme", true);
            }
        }

        return target;
    }

    @GetMapping("/logout")
    public String logout(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
        String target = "/login.jsp";
        session.invalidate();
        Cookie cookie = new Cookie("username", null);
        cookie.setPath(request.getContextPath());
        cookie.setMaxAge(0);
        response.addCookie(cookie);
        return target;
    }

    @GetMapping("/register")
    public String register(Model model,HttpServletRequest request) {
        String target = "/WEB-INF/setuser.jsp";
        String bcryptUsername = request.getParameter("apiKey");
        BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();
        List<BranchUser> branchUsers = branchUserService.findByPasswordIsNull();
        String username = null;
        Integer userNo = null;
        for (BranchUser branchUser : branchUsers) {
            if (bCryptPasswordEncoder.matches(branchUser.getUsername(),bcryptUsername) && branchUser.getPassword() == null) {
                username = branchUser.getUsername();
                userNo = branchUser.getBranchUserNo();
                break;
            }
        }

        if(username != null && userNo != null) {
            model.addAttribute("username", username);
            model.addAttribute("userNo", userNo);
        }else {
            target = "/404error.jsp";
        }
        return target;
    }

    @GetMapping("/reset")
    public String reset(Model model,HttpServletRequest request) {
        String target = "/WEB-INF/setuser.jsp";
        String bcryptUsername = request.getParameter("apiKey");
        BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();
        List<BranchUser> branchUsers = branchUserService.findAll();
        String username = null;
        Integer userNo = null;
        for (BranchUser branchUser : branchUsers) {
            if (bCryptPasswordEncoder.matches(branchUser.getUsername(),bcryptUsername)) {
                username = branchUser.getUsername();
                userNo = branchUser.getBranchUserNo();
                break;
            }
        }

        if(username != null && userNo != null) {
            model.addAttribute("username", username);
            model.addAttribute("userNo", userNo);
            model.addAttribute("reset",true);
        }else {
            target = "/404error.jsp";
        }
        return target;
    }

    @GetMapping("/registeremp")
    public String registerEmp(Model model,HttpServletRequest request) {
        String target = "/WEB-INF/setuser.jsp";
        String apiKey = request.getParameter("apiKey");
        BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();
        List<Employee> employees = employeeService.findAll();
        boolean pass = false;
        Integer empNo = null;
        for (Employee employee : employees) {
            if (bCryptPasswordEncoder.matches(employee.getEmpNo() + "|" + employee.getEmpName() + "|" + employee.getEmail(),apiKey)) {
                pass = true;
                empNo = employee.getEmpNo();
                break;
            }
        }

        if(pass && branchUserService.findByEmpNo(empNo) != null){
            pass = false;
        }

        if(pass) {
            model.addAttribute("empNo", empNo);
        }else {
            target = "/404error.jsp";
        }
        return target;
    }

    @GetMapping("/resetemp")
    public String resetEmp(Model model,HttpServletRequest request) {
        String target = "/WEB-INF/setuser.jsp";
        String apiKey = request.getParameter("apiKey");
        BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();
        List<Employee> employees = employeeService.findAll();
        boolean pass = false;
        Integer empNo = null;
        for (Employee employee : employees) {
            if (bCryptPasswordEncoder.matches(employee.getEmpNo() + "|" + employee.getEmpName() + "|" + employee.getEmail(),apiKey)) {
                pass = true;
                empNo = employee.getEmpNo();
                break;
            }
        }

        if(pass && branchUserService.findByEmpNo(empNo) != null){
            pass = false;
        }

        if(pass) {
            model.addAttribute("empNo", empNo);
        }else {
            target = "/404error.jsp";
        }
        return target;
    }

    @GetMapping("/dummyorder")
    public String dummyorder(HttpSession session, Model model) {
        BranchUser branchUser = (BranchUser) (session.getAttribute("branchUser"));
        int branchNo = branchUser.getBranchNo();
        List<BranchMenu> branchMenus = branchMenuService.getMenuByBranchNo(branchNo);
        List<Table> tables = tableService.getTablesAvailable(branchNo);
        model.addAttribute("tables",tables);
        model.addAttribute("menus",branchMenus);
        return "/WEB-INF/_include/orderTest.jsp";
    }

    @Transactional
    @PostMapping("/order")
    public String order(HttpSession session, Model model, HttpServletRequest request){
        BranchUser branchUser = (BranchUser) (session.getAttribute("branchUser"));
        int branchNo = branchUser.getBranchNo();
        int tableNo = Integer.parseInt(request.getParameter("tableNo"));
        Bill bill = billService.createNewBill(tableNo);
        String menus[] = request.getParameterValues("menu");
        if(menus != null) {
            for (String menu : menus) {
                String qty = request.getParameter(menu);
                String addOns[] = request.getParameterValues("addon_" + menu);
                Order order = new Order();
                order.setMenuNo(Integer.parseInt(menu));
                order.setQuantity(Integer.parseInt(qty));
                order.setAmount(menuService.getMenuByMenuNo(Integer.parseInt(menu)).getMenuPrice() * Integer.parseInt(qty));
                order.setDate(new Date(System.currentTimeMillis()));
                order.setTime(new Time(System.currentTimeMillis()));
                order.setBillNo(bill.getBillNo());
                order.setStatus(Order.WAITING);
                order = orderService.save(order);
                if (addOns != null) {
                    for (String addon : addOns) {
                        OrderAddOn orderAddOn = new OrderAddOn();
                        orderAddOn.setAddOnNo(Integer.parseInt(addon));
                        orderAddOn.setOrderNo(order.getOrderNo());
                        orderAddOnService.save(orderAddOn);
                        order.setAmount(order.getAmount() + (orderAddOn.getAddOn().getPrice() * order.getQuantity()));
                    }
                }
                orderService.save(order);
            }
        }

        List<BranchMenu> branchMenus = branchMenuService.getMenuByBranchNo(branchNo);
        List<Table> tables = tableService.getTablesAvailable(branchNo);
        model.addAttribute("tables",tables);
        model.addAttribute("menus",branchMenus);
        return "/WEB-INF/_include/orderTest.jsp?order=true";
    }

    @Transactional
    @PostMapping("/registerempprocess/{empNo}")
    @ResponseBody
    public String registerEmpProcess(@PathVariable("empNo") int empNo,HttpServletRequest request) throws UnsupportedEncodingException {
        BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();
        Employee employee = employeeService.findByEmpNo(empNo);
        employeeService.save(employee);
        BranchUser branchUser = new BranchUser();
        branchUser.setUsername(request.getParameter("username"));
        branchUser.setPassword(bCryptPasswordEncoder.encode(request.getParameter("password")));
        branchUser.setEmpNo(empNo);
        branchUser.setSentEmail(employee.getEmail());
        branchUser.setBranchNo(employee.getBranchNo());
        branchUser.setRoleNo(Role.EMPLOYEE);
        branchUser.setEmpNo(employee.getEmpNo());
        branchUserService.save(branchUser);
        return request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/loginpage?username=" + URLEncoder.encode(branchUser.getUsername(), "UTF-8");
    }

    @Transactional
    @PostMapping("/registeruserprocess/{userNo}")
    @ResponseBody
    public String registerUserProcess(@PathVariable("userNo") int userNo,HttpServletRequest request) throws UnsupportedEncodingException {
        BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();
        BranchUser branchUser = branchUserService.findByBranchUserNo(userNo);
        branchUser.setPassword(bCryptPasswordEncoder.encode(request.getParameter("password")));
        branchUserService.save(branchUser);
        Branch branch = branchService.getBranch(branchUser.getBranchNo());
        branch.setHasAdmin(true);
        branchService.save(branch);
        return request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/loginpage?username=" + URLEncoder.encode(branchUser.getUsername(), "UTF-8");
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
