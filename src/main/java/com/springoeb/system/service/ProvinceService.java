package com.springoeb.system.service;

import com.springoeb.system.model.Province;
import com.springoeb.system.repository.ProvinceRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProvinceService {
    @Autowired
    private ProvinceRepository provinceRepository;

    public List<Province> findAll(){
        return provinceRepository.findAll();
    }

    public Province findByProvinceNo(int provinceNo){
        return provinceRepository.findByProvinceNo(provinceNo);
    }
}
