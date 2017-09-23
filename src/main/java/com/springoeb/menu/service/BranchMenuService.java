package com.springoeb.menu.service;

import com.springoeb.menu.model.BranchMenu;
import com.springoeb.menu.model.Menu;
import com.springoeb.menu.model.MenuGroup;
import com.springoeb.menu.repository.BranchMenuRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Set;

@Service
public class BranchMenuService {
    @Autowired
    private BranchMenuRepository branchMenuRepository;

    public List<BranchMenu> getMenuSets(int branchNo) {
        return branchMenuRepository.findByBranchNoAndMenu_MenuFlagOrderByMenu_LocalFlagAsc(branchNo, Menu.flagForMenuSet);
    }

    public BranchMenu getMenuByMenuNo(int menuNo, int branchNo) {
        return branchMenuRepository.findByMenuNoAndBranchNo(menuNo, branchNo);
    }

    public BranchMenu save(BranchMenu branchMenu) {
        return branchMenuRepository.save(branchMenu);
    }


    public Set<BranchMenu> getMenusSubBranch(int branchNo) {
        return branchMenuRepository.findByMenu_MenuFlagAndBranchNoOrderByMenu_LocalFlagAscMenu_MenuGroup_MenuCatNoAscMenu_MenuGroupNoAsc(Menu.flagForMenu, branchNo);
    }

    public Set<BranchMenu> getMenusByMenuGroupSubBranch(int menuGroupNo, int branchNo) {
        if (menuGroupNo == MenuGroup.ALL_GROUP) {
            return branchMenuRepository.findByMenu_MenuFlagAndBranchNoOrderByMenu_LocalFlagAscMenu_MenuGroup_MenuCatNoAscMenu_MenuGroupNoAsc(Menu.flagForMenu, branchNo);
        } else {
            return branchMenuRepository.findByMenu_MenuGroupNoAndMenu_MenuFlagAndBranchNoOrderByMenu_LocalFlagAscMenu_MenuGroup_MenuCatNoAscMenu_MenuGroupNoAsc(menuGroupNo, Menu.flagForMenu, branchNo);
        }
    }

    public void save(List<BranchMenu> branchMenus){
        branchMenuRepository.save(branchMenus);
    }
}
