package com.springoeb.menu.service;

import com.springoeb.menu.model.BranchMenu;
import com.springoeb.menu.model.Menu;
import com.springoeb.menu.repository.BranchMenuRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Set;

@Service
public class BranchMenuService {
    @Autowired
    private BranchMenuRepository branchMenuRepository;

    public List<BranchMenu> getMenuSets(int branchNo){
        return branchMenuRepository.findByBranchNoAndMenu_MenuFlag(branchNo,Menu.flagForMenuSet);
    }

    public BranchMenu getMenuByMenuNo(int menuNo,int branchNo){
        return branchMenuRepository.findByMenuNoAndBranchNo(menuNo,branchNo);
    }

    public void save(BranchMenu branchMenu){
        branchMenuRepository.save(branchMenu);
    }

    public Set<BranchMenu> getMenus(){
        return branchMenuRepository.findAllByMenu_MenuFlag(Menu.flagForMenu);
    }

    public Set<BranchMenu> getMenusSubBranch(int branchNo){
        return branchMenuRepository.findByMenu_MenuFlagAndBranchNo(Menu.flagForMenu,branchNo);
    }

    public Set<BranchMenu> getMenusByMenuGroup(int menuGroupNo){
        return branchMenuRepository.findByMenu_MenuGroupNoAndMenu_MenuFlag(menuGroupNo,Menu.flagForMenu);
    }

    public Set<BranchMenu> getMenusByMenuGroupSubBranch(int menuGroupNo,int branchNo){
        return branchMenuRepository.findByMenu_MenuGroupNoAndMenu_MenuFlagAndBranchNo(menuGroupNo,Menu.flagForMenu,branchNo);
    }
}
