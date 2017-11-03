package com.springoeb.cashier.service;

import com.springoeb.cashier.model.OrderAddOn;
import com.springoeb.cashier.repository.OrderAddOnRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderAddOnService {
    @Autowired
    private OrderAddOnRepository orderAddOnRepository;

    public void save(List<OrderAddOn> orderAddOns){
        orderAddOnRepository.save(orderAddOns);
    }

    public void save(OrderAddOn orderAddOn){
        orderAddOnRepository.save(orderAddOn);
    }
}
