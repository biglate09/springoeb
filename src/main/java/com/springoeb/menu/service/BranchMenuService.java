package com.springoeb.menu.service;

import com.springoeb.menu.model.BranchMenu;
import com.springoeb.menu.repository.BranchMenuRepository;
import org.springframework.stereotype.Service;

@Service
public class BranchMenuService {
    private BranchMenuRepository branchMenuRepository;

    public BranchMenu getBranchMenu(int branchNo,int menuNo){
        return branchMenuRepository.findByBranchNoAndMenuNo(branchNo,menuNo);
    }
}
