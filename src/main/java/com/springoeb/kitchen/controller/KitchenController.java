package com.springoeb.kitchen.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.springoeb.cashier.model.Order;
import com.springoeb.cashier.service.OrderService;
import com.springoeb.kitchen.model.ValueBean;
import com.springoeb.stock.model.MaterialHistory;
import com.springoeb.stock.model.MenuMaterial;
import com.springoeb.stock.service.MaterialHistoryService;
import com.springoeb.system.model.BranchUser;
import com.springoeb.table.model.Table;
import com.springoeb.table.service.TableService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

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
    @Autowired
    private MaterialHistoryService materialHistoryService;

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
    public void cancelOrder(@PathVariable("orderNo")String fixedArray){
        String[] stringArr = fixedArray.split("-");
        // menuNo, qty, tableNo, status
        int menuNo = Integer.parseInt(stringArr[0]);
        int qty = Integer.parseInt(stringArr[1]);
        int tableNo = Integer.parseInt(stringArr[2]);
        String status = stringArr[3];
        int delQty = 0;
        List<Order> orders = orderService.findByMenuNoAndTableNoAndStatus(menuNo,tableNo,status);
        if(status.equals(Order.COOKING) || status.equals(Order.COOKED) || status.equals(Order.SERVED)){
            for(Order order : orders){
                if(delQty == qty){
                    break;
                }

                if((qty-delQty) >= order.getQuantity()){
                    order.setStatus(Order.CANCELLED);
                    delQty += order.getQuantity();
                }else{
                    createCancelOrder(order,qty-delQty);
                    order.setAmount((order.getAmount()/order.getQuantity())*(order.getQuantity()-(qty-delQty)));
                    order.setQuantity(order.getQuantity() - (qty - delQty));
                    delQty += (qty - delQty);
                }
            }
        }else{
            for(Order order : orders){
                if(delQty == qty){
                    break;
                }

                if((qty-delQty) >= order.getQuantity()){
                    orderService.removeByOrderNo(order.getOrderNo());
                    delQty += order.getQuantity();
                }else{
                    order.setAmount((order.getAmount()/order.getQuantity())*(order.getQuantity()-(qty-delQty)));
                    order.setQuantity(order.getQuantity() - (qty - delQty));
                    delQty += (qty - delQty);
                }
            }
        }

        orderService.save(orders);
    }

    private void createCancelOrder(Order order,int qty){
        Order o = new Order();
        o.setMenuNo(order.getMenuNo());
        o.setQuantity(qty);
        o.setDate(order.getDate());
        o.setTime(order.getTime());
        o.setBillNo(order.getBillNo());
        o.setStatus(Order.CANCELLED);
        o.setAmount((order.getAmount()/order.getQuantity())*qty);
        orderService.save(o);
    }

    @ResponseBody
    @PostMapping("/changestatus/{orderNo}")
    public void changeStatus(@PathVariable("orderNo")String orderNo,HttpSession session){
        int branchNo = ((BranchUser) (session.getAttribute("branchUser"))).getBranchNo();
        String[] orderNos = orderNo.split("-");
        List<Order> orders = new LinkedList<Order>();
        for(String o : orderNos){
            Order order = orderService.findByOrderNo(Integer.parseInt(o));
            String orderStatus = order.getStatus();
            if(orderStatus.equals(Order.WAITING)){
                order.setStatus(Order.COOKING);
                List<MenuMaterial> materials = order.getMenu().getMenuMaterials();
                for(MenuMaterial m : materials){
                    MaterialHistory mh = new MaterialHistory();
                    mh.setMatName(m.getMaterialItem().getMatItemName());
                    mh.setMatQuantity(-1 * (m.getMaterialItem().getQuantity() * order.getQuantity()));
                    mh.setDate(new Date(System.currentTimeMillis()));
                    mh.setTime(new Time(System.currentTimeMillis()));
                    mh.setMatItemNo(m.getMatItemNo());
                    mh.setBranchNo(branchNo);
                    materialHistoryService.save(mh);
                }
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
