package com.springoeb.cashier.service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.springoeb.cashier.model.Bill;
import com.springoeb.cashier.model.Order;
import com.springoeb.cashier.repository.OrderRepository;
import com.springoeb.kitchen.model.QueueBean;
import com.springoeb.kitchen.model.ValueBean;
import com.springoeb.menu.model.Menu;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Date;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

@Service
public class OrderService {
    @Autowired
    private OrderRepository orderRepository;

    public Map<String, LinkedList<ValueBean>> getMonitorOrders(int branchNo,boolean forChef) throws JsonProcessingException {
        Map<QueueBean, LinkedList<ValueBean>> queueBeans = null;
        Map<String, LinkedList<ValueBean>> jsonQueueBeans = null;
        List<String> status = new LinkedList<String>();
        status.add(Order.WAITING);
        status.add(Order.COOKING);
        if(!forChef) {
            status.add(Order.COOKED);
        }
        List<Order> orders = orderRepository.findByBill_StatusAndStatusInAndBill_Table_BranchNoOrderByStatusDescOrderNoAsc(Bill.UNPAID, status, branchNo);
        if (orders != null && orders.size() > 0) {
            queueBeans = new LinkedHashMap<QueueBean, LinkedList<ValueBean>>();
            for (Order o : orders) {
                QueueBean qb = new QueueBean();
                qb.setMenu(o.getMenu());
                ////////////////////
                LinkedList<Bill> bills = new LinkedList<Bill>();
                bills.add(o.getBill());
                ////////////////////
                qb.setStatus(o.getStatus());
                qb.setAddOns(o.getOrderAddOnList());

                LinkedList<ValueBean> valueBeans = queueBeans.get(qb);
                ValueBean valueBean = new ValueBean();
                valueBean.setTable(o.getBill().getTable());
                valueBean.setQty(o.getQuantity());
                valueBean.setOrderNo(o.getOrderNo());

                if (valueBeans == null || valueBeans.size() == 0) {
                    valueBeans = new LinkedList<ValueBean>();
                }
                valueBeans.add(valueBean);
                queueBeans.put(qb, valueBeans);
            }

            if(queueBeans.size() != 0) {
                jsonQueueBeans = new LinkedHashMap<String,LinkedList<ValueBean>>();
                for (QueueBean qb : queueBeans.keySet()) {
                    ObjectMapper mapper = new ObjectMapper();
                    String json = mapper.writeValueAsString(qb);
                    jsonQueueBeans.put(json,queueBeans.get(qb));
                }
            }
        }
        return jsonQueueBeans;
    }

    public List<Order> getChefOrders(int branchNo) {
        List<String> status = new LinkedList<String>();
        status.add(Order.WAITING);
        status.add(Order.COOKING);
        return orderRepository.findByBill_StatusAndStatusInAndBill_Table_BranchNoOrderByStatusDescOrderNoAsc(Bill.UNPAID, status, branchNo);
    }

    public Order findByOrderNo(int orderNo) {
        return orderRepository.findByOrderNo(orderNo);
    }

    public void removeByOrderNo(int orderNo) {
        orderRepository.removeByOrderNo(orderNo);
    }

    public void removeByOrderNo(List<Integer> orderNo) {
        orderRepository.removeByOrderNo(orderNo);
    }

    public void save(Order order) {
        orderRepository.save(order);
    }

    public void save(List<Order> orders) {
        orderRepository.save(orders);
    }

    public Date findMinMenuOrderDateByBranchNo(int branchNo) {
        return orderRepository.findMinOrderDateByBranchNo(branchNo, Menu.flagForMenu);
    }

    public Date findMaxMenuOrderDateByBranchNo(int branchNo) {
        return orderRepository.findMaxOrderDateByBranchNo(branchNo, Menu.flagForMenu);
    }

    public Date findMinMenuSetOrderDateByBranchNo(int branchNo) {
        return orderRepository.findMinOrderDateByBranchNo(branchNo, Menu.flagForMenuSet);
    }

    public Date findMaxMenuSetOrderDateByBranchNo(int branchNo) {
        return orderRepository.findMaxOrderDateByBranchNo(branchNo, Menu.flagForMenuSet);
    }
}
