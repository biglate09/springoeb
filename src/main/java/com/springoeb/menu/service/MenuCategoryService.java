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
    public List<MenuCategory> getMenuCategories(int restNo){
        return menuCategoryRepository.findByRestNo(restNo);
    }
    public void save(MenuCategory menuCategory){ menuCategoryRepository.save(menuCategory);}
    public void delMenuCategory(int menuCatNo){ menuCategoryRepository.removeByMenuCatNo(menuCatNo);}
    public MenuCategory getMenuCategory(int menuCatNo){
        return menuCategoryRepository.findByMenuCatNo(menuCatNo);
    }
    public boolean chkDuplicateMenuCat(MenuCategory menuCategory){
        List<MenuCategory> menuCategories = menuCategoryRepository.findByMenuCatNameIgnoreCase(menuCategory.getMenuCatName());
        if(menuCategories != null && menuCategories.size() != 0){
            if(menuCategories.size() > 1) {
                return true;
            }else{
                if(menuCategory.getMenuCatNo() != null && menuCategories.get(0).getMenuCatNo() == menuCategory.getMenuCatNo()){
                    return false;
                }else{
                    return true;
                }
            }
        }else{
            return false;
        }
    }
}
