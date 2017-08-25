package com.springoeb.menu.repository;

import com.springoeb.menu.model.BranchMenu;
import com.springoeb.menu.model_key.BranchMenuId;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Set;

@Repository
public interface BranchMenuRepository extends CrudRepository<BranchMenu,BranchMenuId> {
    List<BranchMenu> findByBranchNoAndMenu_MenuFlag(int branchNo,String menuFlag);
    Set<BranchMenu> findByMenu_MenuGroupNoAndMenu_MenuFlag(int menuGroupNo,String menuFlag);
    Set<BranchMenu> findByMenu_MenuGroupNoAndMenu_MenuFlagAndBranchNo(int menuGroupNo,String menuFlag,int branchNo);
    Set<BranchMenu> findAllByMenu_MenuFlag(String menuFlag);
    Set<BranchMenu> findByMenu_MenuFlagAndBranchNo(String menuFlag,int branchNo);
    BranchMenu findByMenuNoAndBranchNo(int menuNo,int branchNo);
}
