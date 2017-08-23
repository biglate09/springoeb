package com.springoeb.menu.service;

import com.springoeb.menu.model.BranchMenu;
import com.springoeb.menu.model.Menu;
import com.springoeb.menu.repository.BranchMenuRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BranchMenuService {
    @Autowired
    private BranchMenuRepository branchMenuRepository;

    public List<BranchMenu> getBranchMenu(int branchNo){
        return branchMenuRepository.findByBranchNoAndMenu_MenuFlag(branchNo, Menu.flagForMenu);
    }
}
