package com.springoeb.menu.repository;

import com.springoeb.menu.model.MenuCategory;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface MenuCategoryRepository extends CrudRepository<MenuCategory,Integer> {
    List<MenuCategory> findAll();
    MenuCategory findByMenuCatNo(int menuCatNo);
    void removeByMenuCatNo(int menuCatNo);
}
