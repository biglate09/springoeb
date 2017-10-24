package com.springoeb.branch.service;

import com.springoeb.branch.model.Branch;
import com.springoeb.branch.repository.BranchRepository;
import com.springoeb.menu.model.BranchMenu;
import com.springoeb.menu.model.Menu;
import com.springoeb.menu.service.BranchMenuService;
import com.springoeb.menu.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.LinkedList;
import java.util.List;

@Service
public class BranchService {
    @Autowired
    private BranchRepository branchRepository;
    @Autowired
    private BranchMenuService branchMenuService;
    @Autowired
    private MenuService menuService;

    public Branch getBranch(int branchNo){
        return branchRepository.findByBranchNo(branchNo);
    }
    public List<Branch> getAllBranches(int restNo){
        return branchRepository.findByRestNo(restNo);
    }
    public void removeByBranchNo(int branchNo){
        branchRepository.removeByBranchNo(branchNo);
    }

    @Transactional
    public Branch save(Branch b){
        Branch branch = branchRepository.save(b);
        List<Menu> menus = menuService.getMenuOfficial();
        List<BranchMenu> branchMenus = new LinkedList<BranchMenu>();
        for(Menu m : menus){
            BranchMenu branchMenu = new BranchMenu();
            branchMenu.setBranchNo(branch.getBranchNo());
            branchMenu.setMenuNo(m.getMenuNo());
            branchMenu.setAvailable(false);
            branchMenus.add(branchMenu);
        }
        branchMenuService.save(branchMenus);
        return branch;
    }
}