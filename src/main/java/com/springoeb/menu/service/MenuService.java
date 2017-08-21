package com.springoeb.menu.service;

import com.springoeb.menu.model.Menu;
import com.springoeb.menu.repository.MenuRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.LinkedList;
import java.util.List;

@Service
public class MenuService {
    @Autowired
    private MenuRepository menuRepository;

    public List<Menu> getMenus(){
        return menuRepository.findAll();
    }
    public List<Menu> getMenusSubBranch(int branchNo){
        List<Integer> localFlag = new LinkedList<Integer>();
        localFlag.add(Menu.OFFICIAL_MENU_FLAG);
        localFlag.add(branchNo);
        return menuRepository.findAllByMenuFlagAndLocalFlagIn(Menu.flagForMenu,localFlag);
    }
    public List<Menu> getMenusByMenuGroup(int menuGroupNo){
        return menuRepository.findByMenuGroupNo(menuGroupNo);
    }
    public List<Menu> getMenusByMenuGroupSubBranch(int menuGroupNo,int branchNo){
        List<Integer> localFlag = new LinkedList<Integer>();
        localFlag.add(Menu.OFFICIAL_MENU_FLAG);
        localFlag.add(branchNo);
        return menuRepository.findByMenuGroupNoAndMenuFlagAndLocalFlagIn(menuGroupNo, Menu.flagForMenu,localFlag);
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

    public boolean chkDuplicateMenu(Menu menu){
        List<Menu> menus = menuRepository.findByMenuNameTHIgnoreCaseOrMenuNameENIgnoreCase(menu.getMenuNameTH(),menu.getMenuNameEN());
        if(menus != null && menus.size() != 0){
            if(menus.size() > 1) {
                return true;
            }else{
                if(menu.getMenuNo() != null && menus.get(0).getMenuNo() == menu.getMenuNo()){
                    return false;
                }else{
                    return true;
                }
            }
        }else{
            return false;
        }
    }
}
