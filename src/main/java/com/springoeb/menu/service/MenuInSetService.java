package com.springoeb.menu.service;

import com.springoeb.menu.model.MenuInSet;
import com.springoeb.menu.repository.MenuInSetRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MenuInSetService {
    @Autowired
    private MenuInSetRepository menuInSetRepository;

    public void save(List<MenuInSet> msm){
        menuInSetRepository.save(msm);
    }

    public void removeMenuSetMenuByMenuSetNo(int menuSetNo){
        menuInSetRepository.removeByMenuNo(menuSetNo);
    }
}
