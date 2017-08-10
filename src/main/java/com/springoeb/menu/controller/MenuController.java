package com.springoeb.menu.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.springoeb.menu.model.Menu;
import com.springoeb.menu.model.MenuCategory;
import com.springoeb.menu.model.MenuSet;
import com.springoeb.menu.model.StockCategory;
import com.springoeb.menu.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.transaction.Transactional;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

@RequestMapping("/menu")
@Controller
public class MenuController {

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
    private static final String UPLOADED_FOLDER = System.getProperty("user.dir") + "\\src\\main\\webapp\\WEB-INF\\menu\\image\\";

    //----------------------------------------------------------------------------------------------------------//
    @GetMapping("/menu")
    public String toMenuIndex() {
        return MENU_PATH + "menu.jsp";
    }

    @PostMapping("/getmenus")
    @ResponseBody
    public String getMenus(Model model) throws JsonProcessingException {
        List<Menu> menus = menuService.getMenus();
        ObjectMapper mapper = new ObjectMapper();
        String json = mapper.writeValueAsString(menus);
        return json;
    }

    @ResponseBody
    @PostMapping("/managemenu")
    public void addAndEditMenu(@ModelAttribute("menu") Menu menu, @RequestParam("file") MultipartFile file) throws IOException {
        byte[] bytes = file.getBytes();
        Path path = Paths.get(UPLOADED_FOLDER + System.currentTimeMillis() + file.getOriginalFilename());
        Files.write(path, bytes);
    }

    @ResponseBody
    @DeleteMapping("/delmenu/{menuNo}")
    public void delMenu(@PathVariable("menuNo") int menuNo) {
        menuService.delMenu(menuNo);
    }

    @ResponseBody
    @PutMapping("/getmenu/{menuNo}")
    public String getMenu(@PathVariable("menuNo") int menuNo) throws JsonProcessingException {
        Menu menu = menuService.getMenuCategory(menuNo);
        ObjectMapper mapper = new ObjectMapper();
        String json = mapper.writeValueAsString(menu);
        return json;
    }

    //----------------------------------------------------------------------------------------------------------//
    @GetMapping("/menuset")
    public String toMenuSetIndex() {
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
    public String toMenuCategory(Model model) {
        List<StockCategory> stockCategories = stockCategoryService.findAll();
        model.addAttribute("stockCategories", stockCategories);
        return MENU_PATH + "menucategory.jsp";
    }

    @PostMapping("/getmenucategories")
    @ResponseBody
    public String getMenuCategories() throws JsonProcessingException {
        List<MenuCategory> menuCategories = menuCategoryService.getMenuCategories();
        ObjectMapper mapper = new ObjectMapper();
        String json = mapper.writeValueAsString(menuCategories);
        return json;
    }

    @PostMapping("/managemenucategory")
    @ResponseBody
    public void addAndEditMenuCategory(@ModelAttribute("menucategory") MenuCategory menuCategory) throws Exception {
        if (menuCategory.getMenuCatNo() != null) { // edit
            if (!menuCategoryService.getMenuCategory(menuCategory.getMenuCatNo()).equals(menuCategory)) {
                if (!menuCategoryService.chkDuplicateMenuCat(menuCategory)) {
                    menuCategoryService.save(menuCategory);
                } else {
                    throw new Exception();
                }
            } else {
                throw new Exception();
            }
        } else { // add
            if (!menuCategoryService.chkDuplicateMenuCat(menuCategory)) {
                menuCategoryService.save(menuCategory);
            } else {
                throw new Exception();
            }
        }
    }

    @Transactional
    @DeleteMapping("/delmenucategory/{menuCatNo}")
    @ResponseBody
    public void delMenuCategory(@PathVariable("menuCatNo") int menuCatNo) {
        menuCategoryService.delMenuCategory(menuCatNo);
    }

    @Transactional
    @PutMapping("/getmenucategory/{menuCatNo}")
    @ResponseBody
    public String getMenuCategory(@PathVariable("menuCatNo") int menuCatNo) throws JsonProcessingException {
        MenuCategory menuCategory = menuCategoryService.getMenuCategory(menuCatNo);
        ObjectMapper mapper = new ObjectMapper();
        String json = mapper.writeValueAsString(menuCategory);
        return json;
    }
    //----------------------------------------------------------------------------------------------------------//
}