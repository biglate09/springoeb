package com.springoeb.kitchen.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.springoeb.cashier.model.Order;
import com.springoeb.cashier.model.OrderAddOn;
import com.springoeb.cashier.service.OrderService;
import com.springoeb.kitchen.model.ValueBean;
import com.springoeb.system.model.BranchUser;
import com.springoeb.table.model.Table;
import com.springoeb.table.service.TableService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;
import java.sql.Date;
import java.sql.Time;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

@RequestMapping("/kitchen")
@Controller
public class KitchenController {
    private static final String KITCHEN_PATH = "/WEB-INF/kitchen/";
    @Autowired
    private OrderService orderService;
    @Autowired
    private TableService tableService;

    //-----------------------------------------------------------------------------------------------------------//
    @GetMapping("/kitchen")
    public String toKitchenIndex(HttpSession session, Model model) {
        int branchNo = ((BranchUser) (session.getAttribute("branchUser"))).getBranchNo();
        List<Table> tables = tableService.getTablesAvailable(branchNo);
        model.addAttribute("tables",tables);
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

    @Transactional
    @ResponseBody
    @DeleteMapping("/cancelorder/{orderNo}")
    public void cancelOrder(@PathVariable("orderNo")String fixedArray, HttpServletRequest request){
        String[] stringArr = fixedArray.split("-");
        // orderNo, qty , tableNo
        int orderNo = Integer.parseInt(stringArr[0]);
        int qty = Integer.parseInt(stringArr[1]);
        Order order = orderService.findByOrderNo(Integer.parseInt(stringArr[0]));

        if(order.getStatus().equals(Order.COOKING) || order.getStatus().equals(Order.COOKED) || order.getStatus().equals(Order.SERVED)){
            if(order.getQuantity() - qty == 0){
                order.setStatus(Order.CANCELLED);
                order.setQuantity(0);
                order.setAmount(0.00);
                orderService.save(order);
            }else{
                order.setQuantity(order.getQuantity() - qty);
                double decrease = order.getMenu().getMenuPrice();
                for(OrderAddOn oa : order.getOrderAddOnList()){
                    decrease += oa.getAddOn().getPrice();
                }
                order.setAmount(order.getAmount() - (decrease*qty));
                orderService.save(order);

                Order cancelOrder = new Order();
                cancelOrder.setMenuNo(order.getMenuNo());
                cancelOrder.setQuantity(qty);
                cancelOrder.setAmount(0.00);
                cancelOrder.setDate(new Date(System.currentTimeMillis()));
                cancelOrder.setTime(new Time(System.currentTimeMillis()));
                cancelOrder.setBillNo(order.getBillNo());
                cancelOrder.setStatus(Order.CANCELLED);
                orderService.save(cancelOrder);
            }
        }else{
            if(order.getQuantity() - qty == 0){
                orderService.removeByOrderNo(orderNo);
            }else{
                order.setQuantity(order.getQuantity() - qty);
                double decrease = order.getMenu().getMenuPrice();
                for(OrderAddOn oa : order.getOrderAddOnList()){
                    decrease += oa.getAddOn().getPrice();
                }
                order.setAmount(order.getAmount() - (decrease*qty));
                orderService.save(order);
            }
        }
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
