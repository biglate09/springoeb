package com.springoeb.kitchen.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.springoeb.cashier.model.Order;
import com.springoeb.cashier.service.OrderService;
import com.springoeb.system.model.BranchUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@RequestMapping("/kitchen")
@Controller
public class KitchenController {
    private static final String KITCHEN_PATH = "/WEB-INF/kitchen/";
    @Autowired
    private OrderService orderService;

    //-----------------------------------------------------------------------------------------------------------//
    @GetMapping("/kitchen")
    public String toKitchenIndex() {
        return KITCHEN_PATH + "kitchen.jsp";
    }
    @ResponseBody
    @PutMapping("/getmonitororders")
    public String getMonitorOrders(HttpSession session) throws JsonProcessingException {
        int branchNo = ((BranchUser) (session.getAttribute("branchUser"))).getBranchNo();
        Map<String,Integer> orders = orderService.getMonitorOrders(branchNo);
        ObjectMapper mapper = new ObjectMapper();
        String json = mapper.writeValueAsString(orders);
        return json;
    }

    @ResponseBody
    @PutMapping("/getcheforders")
    public String getChefOrders(HttpSession session) throws JsonProcessingException {
        int branchNo = ((BranchUser) (session.getAttribute("branchUser"))).getBranchNo();
        List<Order> orders = orderService.getChefOrders(branchNo);
        ObjectMapper mapper = new ObjectMapper();
        String json = mapper.writeValueAsString(orders);
        return json;
    }

    @ResponseBody
    @DeleteMapping("/cancelorder/{orderNo}")
    public void cancelOrder(@PathVariable("orderNo")int orderNo){
        Order order = orderService.findByOrderNo(orderNo);
        String orderStatus = order.getStatus();
        if(orderStatus.equals(Order.RESERVED) || orderStatus.equals(Order.WAITING)){
            orderService.removeByOrderNo(orderNo);
        }else{
            order.setStatus(Order.CANCELLED);
            orderService.save(order);
        }
    }
    @ResponseBody
    @PostMapping("/changestatus/{orderNo}")
    public void changeStatus(@PathVariable("orderNo")int orderNo){
        Order order = orderService.findByOrderNo(orderNo);
        String orderStatus = order.getStatus();
        if(orderStatus.equals(Order.WAITING)){
            order.setStatus(Order.COOKING);
        }else if(orderStatus.equals(Order.COOKING)) {
            order.setStatus(Order.COOKED);
        }else if(orderStatus.equals(Order.COOKED)){
            order.setStatus(Order.SERVED);
        }
        orderService.save(order);
    }
    //-----------------------------------------------------------------------------------------------------------//
    @GetMapping("/chefmonitor")
    public String toChefMonitorIndex() {
        return KITCHEN_PATH + "chefmonitor.jsp";
    }
}
