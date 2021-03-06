package com.springoeb.menu.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.springoeb.menu.model.*;
import com.springoeb.menu.service.*;
import com.springoeb.stock.model.MaterialItem;
import com.springoeb.stock.model.MenuMaterial;
import com.springoeb.stock.service.MaterialItemService;
import com.springoeb.stock.service.MenuMaterialService;
import com.springoeb.branch.model.Branch;
import com.springoeb.system.model.BranchUser;
import com.springoeb.branch.service.BranchService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;
import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;

@RequestMapping("/menu")
@Controller
public class MenuController {

    @Autowired
    private MenuService menuService;
    @Autowired
    private MenuInSetService menuInSetService;
    @Autowired
    private MenuCategoryService menuCategoryService;
    @Autowired
    private MenuGroupService menuGroupService;
    @Autowired
    private BranchMenuService branchMenuService;
    @Autowired
    private BranchService branchService;
    @Autowired
    private MaterialItemService materialItemService;
    @Autowired
    private MenuMaterialService menuMaterialService;
    @Autowired
    private AddOnService addOnService;

    private static final String MENU_PATH = "/WEB-INF/menu/";

    //-----------------------------------------------------------------------------------------------------------//
    @GetMapping("/menu")
    public String toMenuIndex(Model model, HttpSession session) {
        BranchUser branchUser = (BranchUser) (session.getAttribute("branchUser"));
        List<MenuGroup> menuGroups = menuGroupService.getMenuGroupsOrderByMenuCatNo(branchUser.getBranch().getRestNo());
        List<MaterialItem> materialItems = materialItemService.getAllMaterials(branchUser.getBranch().getRestNo());
        model.addAttribute("menuGroups", menuGroups);
        model.addAttribute("materialItems", materialItems);
        return MENU_PATH + "menu.jsp";
    }

    @ResponseBody
    @PostMapping("/getmenus/{menuGroupNo}")
    public String getMenus(@PathVariable("menuGroupNo") int menuGroupNo, Model model, HttpSession session) throws JsonProcessingException {
        ObjectMapper mapper = new ObjectMapper();
        BranchUser branchUser = (BranchUser) (session.getAttribute("branchUser"));
        int branchNo = branchUser.getBranchNo();
        Set<BranchMenu> menus = branchMenuService.getMenusByMenuGroupSubBranch(menuGroupNo, branchNo);
        String json = "[" + mapper.writeValueAsString(menus) + ",";

        if (branchNo == branchUser.getBranch().getMainBranchNo()) {
            List<Menu> otherMenus = menuService.getMenusOtherByMenuGroupNo(menuGroupNo, branchNo, branchUser.getBranch().getRestNo());
            if (otherMenus != null && otherMenus.size() != 0) {
                String jsonOther = mapper.writeValueAsString(otherMenus);
                json += jsonOther + "]";
            } else {
                json += "[]]";
            }
        } else {
            json += "[]]";
        }

        return json;
    }

    @Transactional
    @ResponseBody
    @PostMapping("/managemenu")
    public void addAndEditMenu(@RequestParam("menuPicPath") MultipartFile file, HttpServletRequest request, HttpSession session) throws Exception {
        BranchUser branchUser = (BranchUser) (session.getAttribute("branchUser"));
        int branchNo = branchUser.getBranchNo();

        Menu menu = new Menu();
        byte[] bytes = file.getBytes();
        Integer menuNo = request.getParameter("menuNo") != null ? Integer.parseInt(request.getParameter("menuNo")) : null;

        if (menuNo != null) {
            menu = menuService.getMenuByMenuNo(menuNo);
            menu.setMenuNo(menuNo);
        } else {
            //only for add
            menu.setLocalFlag(request.getParameter("localFlag") != null ? Menu.OFFICIAL_MENU_FLAG : branchNo);
        }

        menu.setMenuNameTH(request.getParameter("menuNameTH"));
        menu.setMenuNameEN(request.getParameter("menuNameEN"));
        menu.setMenuPrice(Double.parseDouble(request.getParameter("menuPrice")));
        menu.setMenuDesc(request.getParameter("menuDesc").trim().equals("") ? null : request.getParameter("menuDesc").trim());
        menu.setMenuGroupNo(Integer.parseInt(request.getParameter("menuGroupNo")));
        menu.setMenuFlag(Menu.flagForMenu);
        menu.setRestNo(branchUser.getBranch().getRestNo());

        if (menuNo != null) {
            menu.setMenuNo(menuNo);
        }

//        if (!menuService.chkDuplicateMenu(menu)) {
        if (!file.getOriginalFilename().equals("")) {
            String menuPicPath = null;
            if (menuNo != null) {
                Menu tmpMenu = menuService.getMenuByMenuNo(menuNo);
                if (tmpMenu != null) {
                    menuService.getMenuByMenuNo(menuNo).getMenuPicPath();
                }
            }
            //pic path before change
            String filename = System.currentTimeMillis() + file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf('.'));
            Path path = Paths.get(request.getServletContext().getRealPath("/images/") + filename);
            Files.write(path, bytes);
            menu.setMenuPicPath(filename);
            if (menuNo != null) {
                File picFile = new File(request.getServletContext().getRealPath("/images/") + menuPicPath);
                picFile.delete();
            }
        }

        Menu insertedMenu = menuService.save(menu);

        if (request.getParameter("localFlag") != null) {
            List<Branch> branches = branchService.getAllBranches(branchUser.getBranch().getRestNo());
            for (Branch b : branches) {
                BranchMenu branchMenu = new BranchMenu();
                branchMenu.setBranchNo(b.getBranchNo());
                branchMenu.setMenuNo(insertedMenu.getMenuNo());
                if (b.getBranchNo() == branchNo) {
                    branchMenu.setAvailable(request.getParameter("menuAvailable") == null ? false : true);
                } else {
                    branchMenu.setAvailable(false);
                }
                branchMenuService.save(branchMenu);
            }
        } else {
            BranchMenu branchMenu = new BranchMenu();
            branchMenu.setBranchNo(branchNo);
            branchMenu.setMenuNo(insertedMenu.getMenuNo());
            branchMenu.setAvailable(false);
            branchMenu.setAvailable(request.getParameter("menuAvailable") == null ? false : true);
            branchMenuService.save(branchMenu);
        }

        menuMaterialService.removeByMenuNo(insertedMenu.getMenuNo());
        Map<String, String[]> parameterMap = request.getParameterMap();
        List<MenuMaterial> menuMaterials = new LinkedList<MenuMaterial>();
        for (String key : parameterMap.keySet()) {
            if (key.indexOf("materialamount") != -1) {
                String amount = parameterMap.get(key)[0];
                if (amount != null && !amount.trim().equals("") && Double.parseDouble(amount) != 0) {
                    MenuMaterial mm = new MenuMaterial();
                    mm.setMatItemNo(Integer.parseInt(key.substring("materialamount".length(), key.length())));
                    mm.setMenuNo(insertedMenu.getMenuNo());
                    mm.setQuantity(Double.parseDouble(amount));
                    menuMaterials.add(mm);
                }
            } else if (key.indexOf("addonqty") != -1) {
                String addOnQty = parameterMap.get(key)[0];
                if (addOnQty != null && !addOnQty.trim().equals("")) {
                    if (Double.parseDouble(addOnQty) == 0) {
                        addOnService.removeByMenuNoAndMatNo(menuNo==null?insertedMenu.getMenuNo():menuNo, Integer.parseInt(key.substring("addonqty".length(), key.length())));
                    } else {
                        AddOn addOn = addOnService.findByMenuNoAndMatNo(menuNo==null?insertedMenu.getMenuNo():menuNo, Integer.parseInt(key.substring("addonqty".length(), key.length())));
                        if(addOn == null){
                            addOn = new AddOn();
                            addOn.setMenuNo(menuNo==null?insertedMenu.getMenuNo():menuNo);
                            addOn.setMatNo(Integer.parseInt(key.substring("addonqty".length(), key.length())));
                        }
                        addOn.setQty(Double.parseDouble(addOnQty));
                        addOnService.save(addOn);
                    }
                }
            } else if (key.indexOf("addonprice") != -1) {
                String addOnPrice = parameterMap.get(key)[0];
                if (addOnPrice != null && !addOnPrice.trim().equals("") && Double.parseDouble(addOnPrice) != 0) {
                    AddOn addOn = addOnService.findByMenuNoAndMatNo(menuNo==null?insertedMenu.getMenuNo():menuNo, Integer.parseInt(key.substring("addonprice".length(), key.length())));
                    if (addOn != null) {
                        addOn.setPrice(Double.parseDouble(addOnPrice));
                    }
                }
            }
        }
        menuMaterialService.save(menuMaterials);

//        } else {
//            throw new Exception();
//        }


    }

    @ResponseBody
    @PostMapping("/changeavailable")
    public BranchMenu changeAvailable(HttpServletRequest request, HttpSession session) {
        int branchNo = ((BranchUser) (session.getAttribute("branchUser"))).getBranchNo();
        BranchMenu branchMenu = branchMenuService.getMenuByMenuNo(Integer.parseInt(request.getParameter("menuno")), branchNo);
        branchMenu.setAvailable(!branchMenu.isAvailable());
        return branchMenuService.save(branchMenu);
    }

    @Transactional
    @ResponseBody
    @PostMapping("/promoteofficial")
    public Menu promoteOfficial(HttpServletRequest request, HttpSession session) throws Exception {
        BranchUser branchUser = (BranchUser) (session.getAttribute("branchUser"));
        int branchNo = branchUser.getBranchNo();
        Menu menu = menuService.getMenuByMenuNo(Integer.parseInt(request.getParameter("menuno")));
        List<MenuInSet> menuInSets = menu.getMenuInSets();
        if (menuInSets != null) {
            for (MenuInSet mis : menuInSets) {
                if (mis.getMenu().getLocalFlag() != Menu.OFFICIAL_MENU_FLAG) {
                    throw new Exception();
                }
            }
        }
        menu.setLocalFlag(Menu.OFFICIAL_MENU_FLAG);
        Menu m = menuService.save(menu);

        List<Branch> branches = branchService.getAllBranches(branchUser.getBranch().getRestNo());
        for (Branch b : branches) {
            if (b.getBranchNo() != menu.getMenuNo()) {
                BranchMenu bm = new BranchMenu();
                bm.setMenuNo(menu.getMenuNo());
                bm.setBranchNo(b.getBranchNo());
                bm.setAvailable(false);
                branchMenuService.save(bm);
            }
        }
        return m;
    }

    @Transactional
    @ResponseBody
    @DeleteMapping("/delmenu/{menuNo}")
    public void delMenu(@PathVariable("menuNo") int menuNo, HttpServletRequest request) {
        String menuPicPath = menuService.getMenuByMenuNo(menuNo).getMenuPicPath();
        menuService.delMenu(menuNo);
        if (menuService.getMenuByMenuNo(menuNo) == null) {
            File file = new File(request.getServletContext().getRealPath("/images/") + menuPicPath);
            file.delete();
        }
    }

    @ResponseBody
    @PutMapping("/getmenu/{menuNo}")
    public String getMenu(@PathVariable("menuNo") int menuNo, HttpSession session) throws JsonProcessingException {
        int branchNo = ((BranchUser) (session.getAttribute("branchUser"))).getBranchNo();
        BranchMenu menu = branchMenuService.getMenuByMenuNo(menuNo, branchNo);
        ObjectMapper mapper = new ObjectMapper();
        String json = mapper.writeValueAsString(menu);
        return json;
    }

    @ResponseBody
    @PostMapping("/getmenusets")
    public String getMenuSets(HttpSession session) throws JsonProcessingException {
        ObjectMapper mapper = new ObjectMapper();
        BranchUser branchUser = (BranchUser) (session.getAttribute("branchUser"));
        int branchNo = branchUser.getBranchNo();
        List<BranchMenu> branchMenuSets = branchMenuService.getMenuSets(branchNo);
        String json = "[" + mapper.writeValueAsString(branchMenuSets) + ",";

        if (branchNo == branchUser.getBranch().getMainBranchNo()) {
            List<Menu> otherMenuSets = menuService.getMenuSetsOther(branchNo, branchUser.getBranch().getRestNo());
            if (otherMenuSets != null && otherMenuSets.size() != 0) {
                String jsonOther = mapper.writeValueAsString(otherMenuSets);
                json += jsonOther + "]";
            } else {
                json += "[]]";
            }
        } else {
            json += "[]]";
        }

        return json;
    }

    //----------------------------------------------------------------------------------------------------------//
    @GetMapping("/menuset")
    public String toMenuSetIndex(Model model, HttpSession session) {
        int branchNo = ((BranchUser) (session.getAttribute("branchUser"))).getBranchNo();
        Set<BranchMenu> menus = branchMenuService.getMenusSubBranch(branchNo);
        model.addAttribute("menus", menus);
        return MENU_PATH + "menuset.jsp";
    }

    @Transactional
    @ResponseBody
    @PostMapping("/managemenuset")
    public void addAndEditMenuSet(@RequestParam("menuPicPath") MultipartFile file, HttpServletRequest request, HttpSession session) throws Exception {
        BranchUser branchUser = (BranchUser) (session.getAttribute("branchUser"));
        int branchNo = branchUser.getBranchNo();
        Menu menuSet = new Menu();
        byte[] bytes = file.getBytes();
        Integer menuSetNo = request.getParameter("menuNo") != null ? Integer.parseInt(request.getParameter("menuNo")) : null;

        if (menuSetNo != null) {
            menuSet = menuService.getMenuByMenuNo(menuSetNo);
            menuSet.setMenuNo(menuSetNo);
        } else {
            //only for add
            menuSet.setLocalFlag(request.getParameter("localFlag") != null ? Menu.OFFICIAL_MENU_FLAG : branchNo);
        }

        menuSet.setMenuNameTH(request.getParameter("menuNameTH"));
        menuSet.setMenuNameEN(request.getParameter("menuNameEN"));
        menuSet.setMenuPrice(Double.parseDouble(request.getParameter("menuPrice")));
        menuSet.setMenuDesc(request.getParameter("menuDesc").trim().equals("") ? null : request.getParameter("menuDesc").trim());
        menuSet.setRestNo(branchUser.getBranch().getRestNo());
        if (menuSetNo != null) {
            menuSet.setMenuNo(menuSetNo);
        } else {
            menuSet.setMenuFlag(Menu.flagForMenuSet);
        }

//        if (!menuService.chkDuplicateMenu(menuSet)) {
        if (!file.getOriginalFilename().equals("")) {
            String menuPicPath = null;
            if (menuSetNo != null) {
                Menu tmpMenuSet = menuService.getMenuByMenuNo(menuSetNo);
                if (tmpMenuSet != null) {
                    menuPicPath = tmpMenuSet.getMenuPicPath();
                }
            }
            //pic path before change
            String filename = System.currentTimeMillis() + file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf('.'));
            Path path = Paths.get(request.getServletContext().getRealPath("/images/") + filename);
            Files.write(path, bytes);
            menuSet.setMenuPicPath(filename);
            if (menuSetNo != null) {
                File picFile = new File(request.getServletContext().getRealPath("/images/")  + menuPicPath);
                picFile.delete();
            }
        }
        Menu insertedMenuSet = menuService.save(menuSet);
        menuInSetService.removeMenuSetMenuByMenuSetNo(insertedMenuSet.getMenuNo());
        Map<String, String[]> parameterMap = request.getParameterMap();
        List<MenuInSet> menuSetMenus = new LinkedList<MenuInSet>();
        for (String key : parameterMap.keySet()) {
            if (key.indexOf("menuamount") != -1) {
                String amount = parameterMap.get(key)[0];
                if (amount != null && !amount.trim().equals("") && Integer.parseInt(amount) != 0) {
                    MenuInSet msm = new MenuInSet();
                    msm.setMenuSubNo(Integer.parseInt(key.substring(10, key.length())));
                    msm.setMenuNo(insertedMenuSet.getMenuNo());
                    msm.setAmount(Integer.parseInt(amount));
                    menuSetMenus.add(msm);
                }
            }
        }
        menuInSetService.save(menuSetMenus);

        if (request.getParameter("localFlag") != null) {
            List<Branch> branches = branchService.getAllBranches(branchUser.getBranch().getRestNo());
            for (Branch b : branches) {
                BranchMenu branchMenu = new BranchMenu();
                branchMenu.setBranchNo(b.getBranchNo());
                branchMenu.setMenuNo(insertedMenuSet.getMenuNo());
                if (b.getBranchNo() == branchNo) {
                    branchMenu.setAvailable(request.getParameter("available") == null ? false : true);
                } else {
                    branchMenu.setAvailable(false);
                }
                branchMenuService.save(branchMenu);
            }
        } else {
            BranchMenu branchMenu = new BranchMenu();
            branchMenu.setBranchNo(branchNo);
            branchMenu.setMenuNo(insertedMenuSet.getMenuNo());
            branchMenu.setAvailable(false);
            branchMenu.setAvailable(request.getParameter("available") == null ? false : true);
            branchMenuService.save(branchMenu);
        }
//        } else {
//            throw new Exception();
//        }
    }

    @Transactional
    @ResponseBody
    @DeleteMapping("/delmenuset/{menuSetNo}")
    public void delMenuSet(@PathVariable("menuSetNo") int menuSetNo, HttpServletRequest request) {
        String menuSetPicPath = menuService.getMenuByMenuNo(menuSetNo).getMenuPicPath();
        menuService.delMenu(menuSetNo);
        File file = new File(request.getServletContext().getRealPath("/images/") + menuSetPicPath);
        file.delete();
    }

    //----------------------------------------------------------------------------------------------------------//
    @GetMapping("/menugroup")
    public String toMenuGroup(Model model, HttpSession session) {
        BranchUser branchUser = (BranchUser) (session.getAttribute("branchUser"));
        List<MenuCategory> menuCategories = menuCategoryService.getMenuCategories(branchUser.getBranch().getRestNo());
        model.addAttribute("menuCategories", menuCategories);
        return MENU_PATH + "menugroup.jsp";
    }

    @PostMapping("/getmenugroups")
    @ResponseBody
    public String getMenuGroups(HttpSession session) throws JsonProcessingException {
        BranchUser branchUser = (BranchUser) (session.getAttribute("branchUser"));
        List<MenuGroup> menuGroups = menuGroupService.getMenuGroups(branchUser.getBranch().getRestNo());
        ObjectMapper mapper = new ObjectMapper();
        String json = mapper.writeValueAsString(menuGroups);
        return json;
    }

    @PostMapping("/managemenugroup")
    @ResponseBody
    public void addAndEditMenuGroup(@ModelAttribute("menugroup") MenuGroup menuGroup,HttpSession session) throws Exception {
        BranchUser branchUser = (BranchUser) (session.getAttribute("branchUser"));
        int restNo = branchUser.getBranch().getRestNo();
//        if (menuGroup.getMenuGroupNo() != null) { // edit
//            if (!menuGroupService.getMenuGroup(menuGroup.getMenuGroupNo()).equals(menuGroup)) {
//                if (!menuGroupService.chkDuplicateMenuGroup(menuGroup)) {
//                    menuGroupService.save(menuGroup);
//                } else {
//                    throw new Exception();
//                }
//            }
//        } else { // add
//            if (!menuGroupService.chkDuplicateMenuGroup(menuGroup)) {
        menuGroup.setRestNo(restNo);
        menuGroupService.save(menuGroup);
//            } else {
//                throw new Exception();
//            }
//        }
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
    public String getMenuCategories(HttpSession session) throws JsonProcessingException {
        BranchUser branchUser = (BranchUser) (session.getAttribute("branchUser"));
        List<MenuCategory> menuCategories = menuCategoryService.getMenuCategories(branchUser.getBranch().getRestNo());
        ObjectMapper mapper = new ObjectMapper();
        String json = mapper.writeValueAsString(menuCategories);
        return json;
    }

    @PostMapping("/managemenucategory")
    @ResponseBody
    public void addAndEditMenuCategory(@ModelAttribute("menucategory") MenuCategory menuCategory,HttpSession session) throws Exception {
        BranchUser branchUser = (BranchUser) (session.getAttribute("branchUser"));
        int restNo = branchUser.getBranch().getRestNo();
        //        if (menuCategory.getMenuCatNo() != null) { // edit
//            if (!menuCategoryService.getMenuCategory(menuCategory.getMenuCatNo()).equals(menuCategory)) {
//                if (!menuCategoryService.chkDuplicateMenuCat(menuCategory)) {
//                    menuCategoryService.save(menuCategory);
//                } else {
//                    throw new Exception();
//                }
//            } else {
//                throw new Exception();
//            }
//        } else { // add
//            if (!menuCategoryService.chkDuplicateMenuCat(menuCategory)) {
            menuCategory.setRestNo(restNo);
            menuCategoryService.save(menuCategory);
//            } else {
//                throw new Exception();
//            }
//        }
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