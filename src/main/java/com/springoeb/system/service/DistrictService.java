package com.springoeb.system.service;

import com.springoeb.system.model.District;
import com.springoeb.system.repository.DistrictRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DistrictService {
    @Autowired
    private DistrictRepository districtRepository;

    public District findByDistrictNo(int districtNo){
        return districtRepository.findByDistrictNo(districtNo);
    }
}
