package com.springoeb.menu.service;

import com.springoeb.menu.model.MenuCategory;
import com.springoeb.menu.repository.MenuCategoryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MenuCategoryService {
    @Autowired
    private MenuCategoryRepository menuCategoryRepository;

    public List<MenuCategory> getMenuCategories(){
        return menuCategoryRepository.findAll();
    }
}
