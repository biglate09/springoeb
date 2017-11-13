package com.springoeb.system.repository;

import com.springoeb.system.model.Restaurant;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface RestaurantRepository extends CrudRepository<Restaurant,Integer>{

}
