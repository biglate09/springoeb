package com.springoeb.menu.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.springoeb.menu.model.Menu;
import com.springoeb.menu.model.MenuCategory;
import com.springoeb.menu.model.MenuSet;
import com.springoeb.menu.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/menu")
public class MenuController{

    @Autowired
    private MenuService menuService;
    @Autowired
    private MenuCategoryService menuCategoryService;
    @Autowired
    private MenuSetService menuSetService;
    @Autowired
    private MenuSetMenuService menuSetMenuService;
    @Autowired
    private StockCategoryService stockCategoryService;

    private static final String MENU_PATH = "/WEB-INF/menu/";

    //----------------------------------------------------------------------------------------------------------//
    @GetMapping("/menu")
    public String toMenuIndex(){
        return MENU_PATH + "menu.jsp";
    }

    @PostMapping("/ajax/getmenus")
    public String getMenus() throws JsonProcessingException {
        List<Menu> menus = menuService.getMenus();
        ObjectMapper mapper = new ObjectMapper();
        String json = mapper.writeValueAsString(menus);
        return json;
    }
    //----------------------------------------------------------------------------------------------------------//
    @GetMapping("/menuset")
    public String toMenuSetIndex(){
        return MENU_PATH + "menuset.jsp";
    }

    @PostMapping("/ajax/getmenusets")
    public String getMenuSets() throws JsonProcessingException {
        List<MenuSet> menuSets = menuSetService.getMenuSets();
        ObjectMapper mapper = new ObjectMapper();
        String json = mapper.writeValueAsString(menuSets);
        return json;
    }
    //----------------------------------------------------------------------------------------------------------//
    @GetMapping("/menucategory")
    public String toMenuCategory(){
        return MENU_PATH + "menucategory.jsp";
    }

    @PostMapping("/ajax/getmenucategories")
    public String getMenuCategories() throws JsonProcessingException {
        List<MenuCategory> menuCategories = menuCategoryService.getMenuCategories();
        ObjectMapper mapper = new ObjectMapper();
        String json = mapper.writeValueAsString(menuCategories);
        return json;
    }
    //----------------------------------------------------------------------------------------------------------//
}