package com.springoeb.menu.repository;

import com.springoeb.menu.model.MenuSetMenu;
import com.springoeb.menu.model_key.MenuSetMenuId;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface MenuSetMenuRepository extends CrudRepository<MenuSetMenu, MenuSetMenuId> {

}
