package com.springoeb.cashier.repository;

import com.springoeb.cashier.model.OrderAddOn;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface OrderAddOnRepository extends CrudRepository<OrderAddOn,Integer>{
    void save (List<OrderAddOn> orderAddOns);
}