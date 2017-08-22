package com.springoeb.menu.repository;

import com.springoeb.menu.model.BranchMenu;
import com.springoeb.menu.model_key.BranchMenuId;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BranchMenuRepository extends CrudRepository<BranchMenu,BranchMenuId> {
    BranchMenu findByBranchNoAndMenuNo(Integer branchNo, Integer menuNo);
}
