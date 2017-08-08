package com.springoeb.menu.repository;

import com.springoeb.menu.model.Menu;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface MenuRepository extends CrudRepository<Menu,Integer>{
    public List<Menu> findAll();
}
