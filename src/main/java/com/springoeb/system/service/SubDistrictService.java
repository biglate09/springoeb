package com.springoeb.system.service;

import com.springoeb.system.model.SubDistrict;
import com.springoeb.system.repository.SubDistrictRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SubDistrictService {
    @Autowired
    private SubDistrictRepository subDistrictRepository;

    public SubDistrict findBySubDistrictNo(int subDistrictNo){
        return subDistrictRepository.findBySubDistrictNo(subDistrictNo);
    }
}
