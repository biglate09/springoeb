package com.springoeb.menu.repository;

import com.springoeb.menu.model.BranchMenu;
import com.springoeb.menu.model_key.BranchMenuId;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Set;

@Repository
public interface BranchMenuRepository extends CrudRepository<BranchMenu,BranchMenuId> {
    List<BranchMenu> findByBranchNoAndMenu_MenuFlagOrderByMenu_LocalFlagAsc(int branchNo,String menuFlag);
    Set<BranchMenu> findByMenu_MenuGroupNoAndMenu_MenuFlagAndBranchNoOrderByMenu_LocalFlagAscMenu_MenuGroup_MenuCatNoAscMenu_MenuGroupNoAsc(int menuGroupNo,String menuFlag,int branchNo);
    Set<BranchMenu> findByMenu_MenuFlagAndBranchNoOrderByMenu_LocalFlagAscMenu_MenuGroup_MenuCatNoAscMenu_MenuGroupNoAsc(String menuFlag,int branchNo);
    BranchMenu findByMenuNoAndBranchNo(int menuNo,int branchNo);
}
