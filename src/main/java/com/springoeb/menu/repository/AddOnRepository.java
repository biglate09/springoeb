package com.springoeb.menu.repository;

import com.springoeb.menu.model.AddOn;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AddOnRepository extends CrudRepository<AddOn,Integer> {

}