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

    public List<Menu> getMenus() {
        return menuRepository.findAllByMenuFlag(Menu.flagForMenu);
    }

    public List<Menu> getMenusSubBranch(int branchNo) {
        List<Integer> localFlag = new LinkedList<Integer>();
        localFlag.add(Menu.OFFICIAL_MENU_FLAG);
        localFlag.add(branchNo);
        return menuRepository.findAllByMenuFlagAndLocalFlagIn(Menu.flagForMenu, localFlag);
    }

    public List<Menu> getMenusByMenuGroup(int menuGroupNo) {
        return menuRepository.findByMenuGroupNo(menuGroupNo);
    }

    public List<Menu> getMenusByMenuGroupSubBranch(int menuGroupNo, int branchNo) {
        List<Integer> localFlag = new LinkedList<Integer>();
        localFlag.add(Menu.OFFICIAL_MENU_FLAG);
        localFlag.add(branchNo);
        return menuRepository.findByMenuGroupNoAndMenuFlagAndLocalFlagIn(menuGroupNo, Menu.flagForMenu, localFlag);
    }

    public Menu save(Menu menu) {
        return menuRepository.save(menu);
    }

    public void delMenu(int menuNo) {
        menuRepository.deleteByMenuNo(menuNo);
    }

    public Menu getMenuByMenuNo(int menuNo) {
        return menuRepository.findByMenuNo(menuNo);
    }

    public boolean chkDuplicateMenu(Menu menu) {
        List<Menu> menus = menuRepository.findByMenuNameTHIgnoreCaseOrMenuNameENIgnoreCase(menu.getMenuNameTH(), menu.getMenuNameEN());
        if (menus != null && menus.size() != 0) {
            if (menus.size() > 1) {
                return true;
            } else {
                if (menu.getMenuNo() != null && menus.get(0).getMenuNo() == menu.getMenuNo()) {
                    return false;
                } else {
                    return true;
                }
            }
        } else {
            return false;
        }
    }

    public Menu getMenuByMenuNameTH(String menuNameTH) {
        return menuRepository.findByMenuNameTH(menuNameTH);
    }

    //----------------------------------------------------------------------------------------------------------//

    public List<Menu> getMenuSets(int branchNo) {
        List<Menu> menuSets = null;
        if (branchNo == 0) {
            menuSets = menuRepository.findAllByMenuFlag(Menu.flagForMenuSet);
        } else {
            List<Integer> localFlag = new LinkedList<Integer>();
            localFlag.add(Menu.OFFICIAL_MENU_FLAG);
            localFlag.add(branchNo);
            menuSets = menuRepository.findAllByMenuFlagAndLocalFlagIn(Menu.flagForMenuSet,localFlag);
        }

        return menuSets;
    }

    public List<Menu> getMenuSetsOther(int branchNo,int restNo){
        List<Integer> myBranches = new LinkedList<>();
        myBranches.add(Menu.OFFICIAL_MENU_FLAG);
        myBranches.add(branchNo);
        return menuRepository.findByMenuFlagAndLocalFlagNotInAndRestNoOrderByLocalFlagAsc(Menu.flagForMenuSet,myBranches,restNo);
    }

    public List<Menu> getMenusOtherByMenuGroupNo(int menuGroupNo,int branchNo,int restNo){
        List<Integer> myBranches = new LinkedList<>();
        myBranches.add(Menu.OFFICIAL_MENU_FLAG);
        myBranches.add(branchNo);
        if(menuGroupNo == 0){
            return menuRepository.findByMenuFlagAndLocalFlagNotInAndRestNoOrderByLocalFlagAsc(Menu.flagForMenu,myBranches,restNo);
        }else{
            return menuRepository.findByMenuFlagAndMenuGroupNoAndLocalFlagNotInAndRestNoOrderByLocalFlagAsc(Menu.flagForMenu,menuGroupNo,myBranches,restNo);
        }
    }

    public List<Menu> getMenuOfficial(int restNo){
        return menuRepository.findByLocalFlagAndRestNo(0,restNo);
    }
}
