package com.springoeb.system.repository;

import com.springoeb.system.model.District;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface DistrictRepository extends CrudRepository<District,Integer>{
    District findByDistrictNo(int districtNo);
}
