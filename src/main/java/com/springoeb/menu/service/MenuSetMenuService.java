package com.springoeb.menu.service;

import com.springoeb.menu.model.MenuSetMenu;
import com.springoeb.menu.repository.MenuSetMenuRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MenuSetMenuService {
    @Autowired
    private MenuSetMenuRepository menuSetMenuRepository;

    public void save(List<MenuSetMenu> msm){
        menuSetMenuRepository.save(msm);
    }
}
