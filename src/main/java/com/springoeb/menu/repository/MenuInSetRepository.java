package com.springoeb.menu.repository;

import com.springoeb.menu.model.MenuInSet;
import com.springoeb.menu.model_key.MenuInSetId;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface MenuInSetRepository extends CrudRepository<MenuInSet, MenuInSetId> {
    public void removeByMenuNo(int menuNo);
}
