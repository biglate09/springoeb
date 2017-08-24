package com.springoeb.stock.service;


import com.springoeb.stock.model.MaterialMixed;
import com.springoeb.stock.repository.MaterialMixedRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MaterialMixedService {
    @Autowired
    private MaterialMixedRepository materialMixedRepository;

    public void removeByMixedProdNo(int mixedProdNo){
        materialMixedRepository.removeAllByMixedProdNo(mixedProdNo);
    }

    public void save(List<MaterialMixed> materialMixedList){
        materialMixedRepository.save(materialMixedList);
    }
}
