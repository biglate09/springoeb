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

    public void save(MenuCategory menuCategory){
        menuCategoryRepository.save(menuCategory);
    }

    public void delMenuCategory(int menuCategory){
        menuCategoryRepository.removeByMenuCatNo(menuCategory);
    }

    public MenuCategory getMenuCategory(int menuCatNo){
        return menuCategoryRepository.findByMenuCatNo(menuCatNo);
    }

    public boolean chkDuplicateMenuCatNameTH(String menuCatNameTH){
        if(menuCategoryRepository.findByMenuCatNameTH(menuCatNameTH) != null){
            return true;
        }else{
            return false;
        }
    }
}
