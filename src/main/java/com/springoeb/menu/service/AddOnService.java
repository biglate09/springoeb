package com.springoeb.menu.service;

import com.springoeb.menu.model.AddOn;
import com.springoeb.menu.repository.AddOnRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AddOnService {
    @Autowired
    private AddOnRepository addOnRepository;

    public AddOn save(AddOn addOn){
        return addOnRepository.save(addOn);
    }

    public AddOn findByMenuNoAndMatNo(int menuNo, int matNo){
        return addOnRepository.findByMenuNoAndMatNo(menuNo,matNo);
    }

    public void removeByMenuNoAndMatNo(int menuNo,int matNo){
        addOnRepository.removeByMenuNoAndMatNo(menuNo,matNo);
    }

    public AddOn findByAddOnNo(int addOnNo){
        return addOnRepository.findByAddOnNo(addOnNo);
    }
}
