package com.springoeb.stock.service;


import com.springoeb.stock.model.MenuMaterial;
import com.springoeb.stock.repository.MenuMaterialRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MenuMaterialService {
    @Autowired
    private MenuMaterialRepository menuMaterialRepository;

    public void save(List<MenuMaterial> menuMaterials){
        menuMaterialRepository.save(menuMaterials);
    }

    public void removeByMenuNo(int menuNo){
        menuMaterialRepository.removeByMenuNo(menuNo);
    }
}
