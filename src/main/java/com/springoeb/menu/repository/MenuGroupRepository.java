package com.springoeb.menu.repository;

import com.springoeb.menu.model.MenuGroup;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface MenuGroupRepository extends CrudRepository<MenuGroup,Integer> {
    List<MenuGroup> findAll();
    List<MenuGroup> findByMenuGroupNoIsNotNullOrderByMenuCatNo();
    MenuGroup findByMenuGroupNo(int menuGroupNo);
    List<MenuGroup> findByMenuGroupNameTHIgnoreCaseOrMenuGroupNameENIgnoreCase(String menuGroupNameTH,String menuGroupNameEN);
    void removeByMenuGroupNo(int menuGroupNo);
}
