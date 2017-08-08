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
}
