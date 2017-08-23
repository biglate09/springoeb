package com.springoeb.stock.service;


import com.springoeb.stock.repository.MenuMaterialRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MenuMaterialService {
    @Autowired
    private MenuMaterialRepository menuMaterialRepository;

}
