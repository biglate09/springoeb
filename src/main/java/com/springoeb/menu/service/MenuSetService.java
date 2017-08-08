package com.springoeb.menu.service;

import com.springoeb.menu.model.MenuSet;
import com.springoeb.menu.repository.MenuSetRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MenuSetService {
    @Autowired
    private MenuSetRepository menuSetRepository;

    public List<MenuSet> getMenuSets(){
        return menuSetRepository.findAll();
    }
}
