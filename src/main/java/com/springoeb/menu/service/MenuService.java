package com.springoeb.menu.service;

import com.springoeb.menu.model.Menu;
import com.springoeb.menu.repository.MenuRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MenuService {
    @Autowired
    private MenuRepository menuRepository;

    public List<Menu> getMenus(){
        return menuRepository.findAll();
    }
    public List<Menu> getMenusByMenuCategory(int menuCatNo){
        return menuRepository.findByMenuCatNo(menuCatNo);
    }
    public List<Menu> getMenusAvailable(){return menuRepository.findByAvailable(true);}
    public void save(Menu menu){
        menuRepository.save(menu);
    }

    public void delMenu(int menuNo){
        menuRepository.deleteByMenuNo(menuNo);
    }

    public Menu getMenuByMenuNo(int menuNo){
        return menuRepository.findByMenuNo(menuNo);
    }

    public boolean chkDuplicateMenu(Menu menu){
        List<Menu> menus = menuRepository.findByMenuNameTHIgnoreCaseOrMenuNameENIgnoreCase(menu.getMenuNameTH(),menu.getMenuNameEN());
        if(menus != null && menus.size() != 0){
            if(menus.size() > 1) {
                return true;
            }else{
                if(menu.getMenuNo() != null && menus.get(0).getMenuNo() == menu.getMenuNo()){
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
