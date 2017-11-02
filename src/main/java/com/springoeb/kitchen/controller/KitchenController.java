package com.springoeb.kitchen.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.springoeb.cashier.model.Order;
import com.springoeb.cashier.service.OrderService;
import com.springoeb.kitchen.model.ValueBean;
import com.springoeb.system.model.BranchUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.LinkedList;
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
        Map<String,LinkedList<ValueBean>> orders = orderService.getMonitorOrders(branchNo,false);
        ObjectMapper mapper = new ObjectMapper();
        String json = mapper.writeValueAsString(orders);
        return json;
    }

    @ResponseBody
    @PutMapping("/getcheforders")
    public String getChefOrders(HttpSession session) throws JsonProcessingException {
        int branchNo = ((BranchUser) (session.getAttribute("branchUser"))).getBranchNo();
        Map<String,LinkedList<ValueBean>> orders = orderService.getMonitorOrders(branchNo,true);
        ObjectMapper mapper = new ObjectMapper();
        String json = mapper.writeValueAsString(orders);
        return json;
    }

    @ResponseBody
    @DeleteMapping("/cancelorder/{orderNo}")
    public void cancelOrder(@PathVariable("orderNo")String orderNo){
        String[] orderNos = orderNo.split("-");
        List<Order> orders = new LinkedList<Order>();
        List<Integer> deleteOrder = new LinkedList<Integer>();
        for(String o : orderNos) {
            Order order = orderService.findByOrderNo(Integer.parseInt(o));
            String orderStatus = order.getStatus();
            if (orderStatus.equals(Order.RESERVED) || orderStatus.equals(Order.WAITING)) {
                deleteOrder.add(Integer.parseInt(o));
            } else {
                order.setStatus(Order.CANCELLED);
                orders.add(order);
            }
        }

        orderService.removeByOrderNo(deleteOrder);
        orderService.save(orders);
    }
    @ResponseBody
    @PostMapping("/changestatus/{orderNo}")
    public void changeStatus(@PathVariable("orderNo")String orderNo){
        String[] orderNos = orderNo.split("-");
        List<Order> orders = new LinkedList<Order>();
        for(String o : orderNos){
            Order order = orderService.findByOrderNo(Integer.parseInt(o));
            String orderStatus = order.getStatus();
            if(orderStatus.equals(Order.WAITING)){
                order.setStatus(Order.COOKING);
            }else if(orderStatus.equals(Order.COOKING)) {
                order.setStatus(Order.COOKED);
            }else if(orderStatus.equals(Order.COOKED)){
                order.setStatus(Order.SERVED);
            }
            orders.add(order);
        }

        if(orders.size() > 0){
            orderService.save(orders);
        }
    }
    //-----------------------------------------------------------------------------------------------------------//
    @GetMapping("/chefmonitor")
    public String toChefMonitorIndex() {
        return KITCHEN_PATH + "chefmonitor.jsp";
    }
}
