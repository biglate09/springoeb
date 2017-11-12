package com.springoeb.branch.service;

import com.springoeb.branch.model.Branch;
import com.springoeb.branch.repository.BranchRepository;
import com.springoeb.menu.model.BranchMenu;
import com.springoeb.menu.model.Menu;
import com.springoeb.menu.service.BranchMenuService;
import com.springoeb.menu.service.MenuService;
import com.springoeb.promotion.model.BranchPromotion;
import com.springoeb.promotion.model.Promotion;
import com.springoeb.promotion.service.BranchPromotionService;
import com.springoeb.promotion.service.PromotionService;
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
    @Autowired
    private PromotionService promotionService;
    @Autowired
    private BranchPromotionService branchPromotionService;

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
        List<Menu> menus = menuService.getMenuOfficial(branch.getRestNo());
        List<BranchMenu> branchMenus = new LinkedList<BranchMenu>();
        for(Menu m : menus){
            BranchMenu branchMenu = new BranchMenu();
            branchMenu.setBranchNo(branch.getBranchNo());
            branchMenu.setMenuNo(m.getMenuNo());
            branchMenu.setAvailable(false);
            branchMenus.add(branchMenu);
        }
        branchMenuService.save(branchMenus);
        List<Promotion> promotions = promotionService.getPromotionOfficial(branch.getRestNo());
        List<BranchPromotion> branchPromotions = new LinkedList<BranchPromotion>();
        for(Promotion p : promotions){
            System.out.println(p.getPromotionNo() + " : " + branch.getBranchNo());
            BranchPromotion bp = new BranchPromotion();
            bp.setPromotionNo(p.getPromotionNo());
            bp.setBranchNo(branch.getBranchNo());
            bp.setAvailable(false);
            branchPromotions.add(bp);
        }
        branchPromotionService.save(branchPromotions);
        return branch;
    }
}