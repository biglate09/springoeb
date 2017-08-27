package com.springoeb.stock.repository;

import com.springoeb.stock.model.MenuMaterial;
import com.springoeb.stock.model_key.MenuMaterialId;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface MenuMaterialRepository extends CrudRepository<MenuMaterial,MenuMaterialId>{
    void removeByMenuNo(int menuNo);
}
