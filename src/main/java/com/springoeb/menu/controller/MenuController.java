package com.springoeb.menu.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.springoeb.menu.model.*;
import com.springoeb.menu.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;
import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

@RequestMapping("/menu")
@Controller
public class MenuController {

    @Autowired
    private MenuService menuService;
    @Autowired
    private MenuSetService menuSetService;
    @Autowired
    private MenuSetMenuService menuSetMenuService;
    @Autowired
    private MenuCategoryService menuCategoryService;
    @Autowired
    private MenuGroupService menuGroupService;

    private static final String MENU_PATH = "/WEB-INF/menu/";
    private static final String UPLOADED_FOLDER = System.getProperty("user.dir") + "/src/main/webapp/images/";

    //-----------------------------------------------------------------------------------------------------------//
    @GetMapping("/menu")
    public String toMenuIndex(Model model) {
        List<MenuGroup> menuGroups = menuGroupService.getMenuGroups();
        model.addAttribute("menuGroups", menuGroups);
        return MENU_PATH + "menu.jsp";
    }

    @ResponseBody
    @PostMapping("/getmenus/{menuCatNo}")
    public String getMenus(@PathVariable("menuCatNo") int menuCatNo, Model model) throws JsonProcessingException {
        List<Menu> menus = menuService.getMenus();

        if (menuCatNo != 0) {
            menus = menuService.getMenusByMenuCategory(menuCatNo);
        }

        ObjectMapper mapper = new ObjectMapper();
        String json = mapper.writeValueAsString(menus);
        return json;
    }

    @ResponseBody
    @PostMapping("/managemenu")
    public void addAndEditMenu(@RequestParam("menuPicPath") MultipartFile file, HttpServletRequest request) throws Exception {
        Menu menu = new Menu();
        byte[] bytes = file.getBytes();
        Integer menuNo = request.getParameter("menuNo") != null ? Integer.parseInt(request.getParameter("menuNo")) : null;

        if (menuNo != null) {
            menu = menuService.getMenuByMenuNo(menuNo);
            menu.setMenuNo(menuNo);
        }

        menu.setMenuNameTH(request.getParameter("menuNameTH"));
        menu.setMenuNameEN(request.getParameter("menuNameEN"));
        menu.setMenuPrice(Double.parseDouble(request.getParameter("menuPrice")));
        menu.setMenuDesc(request.getParameter("menuDesc"));
        menu.setMenuGroupNo(Integer.parseInt(request.getParameter("menuGroupNo")));
        menu.setAvailable(request.getParameter("menuAvailable") == null ? false : true);
        if (menuNo != null) {
            menu.setMenuNo(menuNo);
        }

        if (!menuService.chkDuplicateMenu(menu)) {
            if (!file.getOriginalFilename().equals("")) {
                String menuPicPath = null;
                if(menuNo != null) {
                    Menu tmpMenu = menuService.getMenuByMenuNo(menuNo);
                    if (tmpMenu != null) {
                        menuService.getMenuByMenuNo(menuNo).getMenuPicPath();
                    }
                }
                //pic path before change
                String filename = System.currentTimeMillis() + file.getOriginalFilename();
                Path path = Paths.get(UPLOADED_FOLDER + "menu/" + filename);
                Files.write(path, bytes);
                menu.setMenuPicPath(filename);
                if (menuNo != null) {
                    File picFile = new File(UPLOADED_FOLDER + "menu/" + menuPicPath);
                    picFile.delete();
                }
            }
            menuService.save(menu);
        } else {
            throw new Exception();
        }
    }

    @ResponseBody
    @PostMapping("/changeavailable")
    public void changeAvailable(HttpServletRequest request) {
        Menu menu = menuService.getMenuByMenuNo(Integer.parseInt(request.getParameter("menuno")));
        menu.setAvailable(!menu.getAvailable());
        menuService.save(menu);
    }

    @Transactional
    @ResponseBody
    @DeleteMapping("/delmenu/{menuNo}")
    public void delMenu(@PathVariable("menuNo") int menuNo) {
        String menuPicPath = menuService.getMenuByMenuNo(menuNo).getMenuPicPath();
        menuService.delMenu(menuNo);
        if(menuService.getMenuByMenuNo(menuNo) == null) {
            File file = new File(UPLOADED_FOLDER + "menu/" + menuPicPath);
            file.delete();
        }
    }

    @ResponseBody
    @PutMapping("/getmenu/{menuNo}")
    public String getMenu(@PathVariable("menuNo") int menuNo) throws JsonProcessingException {
        Menu menu = menuService.getMenuByMenuNo(menuNo);
        ObjectMapper mapper = new ObjectMapper();
        String json = mapper.writeValueAsString(menu);
        return json;
    }

    //----------------------------------------------------------------------------------------------------------//
    @GetMapping("/menuset")
    public String toMenuSetIndex(Model model) {
        model.addAttribute("menus", menuService.getMenus());
        return MENU_PATH + "menuset.jsp";
    }

    @ResponseBody
    @PostMapping("/getmenusets")
    public String getMenuSets() throws JsonProcessingException {
        List<MenuSet> menuSets = menuSetService.getMenuSets();
        ObjectMapper mapper = new ObjectMapper();
        String json = mapper.writeValueAsString(menuSets);
        return json;
    }

    @ResponseBody
    @PutMapping("/getmenuset/{menuSetNo}")
    public String getMenuSet(@PathVariable("menuSetNo") int menuSetNo) throws JsonProcessingException {
        MenuSet menuSet = menuSetService.getMenuSetByMenuSetNo(menuSetNo);
        ObjectMapper mapper = new ObjectMapper();
        String json = mapper.writeValueAsString(menuSet);
        return json;
    }

    @Transactional
    @ResponseBody
    @PostMapping("/managemenuset")
    public void addAndEditMenuSet(@RequestParam("menuSetPicPath") MultipartFile file, HttpServletRequest request) throws Exception {
        MenuSet menuSet = new MenuSet();
        byte[] bytes = file.getBytes();
        Integer menuSetNo = request.getParameter("menuSetNo") != null ? Integer.parseInt(request.getParameter("menuSetNo")) : null;

        if (menuSetNo != null) {
            menuSet = menuSetService.getMenuSetByMenuSetNo(menuSetNo);
            menuSet.setMenuSetNo(menuSetNo);
        }

        menuSet.setMenuSetNameTH(request.getParameter("menuSetNameTH"));
        menuSet.setMenuSetNameEN(request.getParameter("menuSetNameEN"));
        menuSet.setMenuSetPrice(Double.parseDouble(request.getParameter("menuSetPrice")));
        menuSet.setMenuSetDesc(request.getParameter("menuSetDesc"));
        menuSet.setAvailable(request.getParameter("available") == null ? false : true);
        if (menuSetNo != null) {
            menuSet.setMenuSetNo(menuSetNo);
        }

        if (!menuSetService.chkDuplicateMenuSet(menuSet)) {
            if (!file.getOriginalFilename().equals("")) {
                String menuPicPath = null;
                if(menuSetNo != null) {
                    MenuSet tmpMenuSet = menuSetService.getMenuSetByMenuSetNo(menuSetNo);
                    if (tmpMenuSet != null) {
                        menuPicPath = tmpMenuSet.getMenuSetPicPath();
                    }
                }
                //pic path before change
                String filename = System.currentTimeMillis() + file.getOriginalFilename();
                Path path = Paths.get(UPLOADED_FOLDER + "menuset/" + filename);
                Files.write(path, bytes);
                menuSet.setMenuSetPicPath(filename);
                if (menuSetNo != null) {
                    File picFile = new File(UPLOADED_FOLDER + "menuset/" + menuPicPath);
                    picFile.delete();
                }
            }
            menuSetService.save(menuSet);
            MenuSet insertedMenuSet = menuSetService.getMenuSetByMenuSetNameTH(menuSet.getMenuSetNameTH());
            menuSetMenuService.removeMenuSetMenuByMenuSetNo(insertedMenuSet.getMenuSetNo());
            Map<String,String[]> parameterMap = request.getParameterMap();
            List<MenuSetMenu> menuSetMenus = new LinkedList<MenuSetMenu>();
            for(String key : parameterMap.keySet()){
                if(key.indexOf("menuamount") != -1){
                    String amount = parameterMap.get(key)[0];
                    if(amount != null && !amount.trim().equals("") && Integer.parseInt(amount) != 0){
                        MenuSetMenu msm = new MenuSetMenu();
                        msm.setMenuNo(Integer.parseInt(key.substring(10,key.length())));
                        msm.setMenuSetNo(insertedMenuSet.getMenuSetNo());
                        msm.setAmount(Integer.parseInt(amount));
                        menuSetMenus.add(msm);
                    }
                }
            }
            menuSetMenuService.save(menuSetMenus);
        } else {
            throw new Exception();
        }
    }

    @Transactional
    @ResponseBody
    @DeleteMapping("/delmenuset/{menuSetNo}")
    public void delMenuSet(@PathVariable("menuSetNo") int menuSetNo) {
        String menuSetPicPath = menuSetService.getMenuSetByMenuSetNo(menuSetNo).getMenuSetPicPath();
        menuSetService.delMenuSet(menuSetNo);
        File file = new File(UPLOADED_FOLDER + "menuset/" + menuSetPicPath);
        file.delete();
    }

    @ResponseBody
    @PostMapping("/changemenusetavailable")
    public void changeMenuSetAvailable(HttpServletRequest request) {
        MenuSet menuSet = menuSetService.getMenuSetByMenuSetNo(Integer.parseInt(request.getParameter("menusetno")));
        menuSet.setAvailable(!menuSet.getAvailable());
        menuSetService.save(menuSet);
    }

    //----------------------------------------------------------------------------------------------------------//
    @GetMapping("/menugroup")
    public String toMenuGroup(Model model) {
        List<MenuCategory> menuCategories  = menuCategoryService.getMenuCategories();
        model.addAttribute("menuCategories", menuCategories);
        return MENU_PATH + "menugroup.jsp";
    }

    @PostMapping("/getmenugroups")
    @ResponseBody
    public String getMenuGroups() throws JsonProcessingException {
        List<MenuGroup> menuGroups = menuGroupService.getMenuGroups();
        ObjectMapper mapper = new ObjectMapper();
        String json = mapper.writeValueAsString(menuGroups);
        return json;
    }

    @PostMapping("/managemenugroup")
    @ResponseBody
    public void addAndEditMenuGroup(@ModelAttribute("menugroup") MenuGroup menuGroup) throws Exception {
        if (menuGroup.getMenuGroupNo() != null) { // edit
            if (!menuGroupService.getMenuGroup(menuGroup.getMenuGroupNo()).equals(menuGroup)) {
                if (!menuGroupService.chkDuplicateMenuGroup(menuGroup)) {
                    menuGroupService.save(menuGroup);
                } else {
                    throw new Exception();
                }
            } else {
                throw new Exception();
            }
        } else { // add
            if (!menuGroupService.chkDuplicateMenuGroup(menuGroup)) {
                menuGroupService.save(menuGroup);
            } else {
                throw new Exception();
            }
        }
    }

    @Transactional
    @DeleteMapping("/delmenugroup/{menuGroupNo}")
    @ResponseBody
    public void delMenuGroup(@PathVariable("menuGroupNo") int menuGroupNo) {
        menuGroupService.delMenuGroup(menuGroupNo);
    }

    @Transactional
    @PutMapping("/getmenugroup/{menuGroupNo}")
    @ResponseBody
    public String getMenuGroup(@PathVariable("menuGroupNo") int menuGroupNo) throws JsonProcessingException {
        MenuGroup menuGroup = menuGroupService.getMenuGroup(menuGroupNo);
        ObjectMapper mapper = new ObjectMapper();
        String json = mapper.writeValueAsString(menuGroup);
        return json;
    }
    //----------------------------------------------------------------------------------------------------------//

    @GetMapping("/menucategory")
    public String toMenuCategoryIndex(Model model) {
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
    @DeleteMapping("/deletemenucategory/{menuCatNo}")
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
    //-----------------------------------------------------------------------------------------------------------//
}