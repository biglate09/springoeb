package com.springoeb.menu.repository;

import com.springoeb.menu.model.MenuSet;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface MenuSetRepository extends CrudRepository<MenuSet,Integer>{
    List<MenuSet> findAll();
}
