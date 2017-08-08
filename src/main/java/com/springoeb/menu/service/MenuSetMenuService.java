package com.springoeb.menu.service;

import com.springoeb.menu.repository.MenuSetMenuRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MenuSetMenuService {
    @Autowired
    private MenuSetMenuRepository menuSetMenuRepository;
}
