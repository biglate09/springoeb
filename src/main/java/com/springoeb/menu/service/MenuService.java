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
    public void save(Menu menu){
        menuRepository.save(menu);
    }

    public void delMenu(int menuNo){
        menuRepository.deleteByMenuNo(menuNo);
    }

    public Menu getMenuByMenuNo(int menuNo){
        return menuRepository.findByMenuNo(menuNo);
    }
}
