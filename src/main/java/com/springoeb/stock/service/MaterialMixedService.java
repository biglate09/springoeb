package com.springoeb.stock.service;


import com.springoeb.stock.repository.MaterialMixedRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MaterialMixedService {
    @Autowired
    private MaterialMixedRepository materialMixedRepository;

}
