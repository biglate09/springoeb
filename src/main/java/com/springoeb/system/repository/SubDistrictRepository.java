package com.springoeb.system.repository;

import com.springoeb.system.model.SubDistrict;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface SubDistrictRepository extends CrudRepository<SubDistrict,Integer>{
    SubDistrict findBySubDistrictNo(int subDistrictNo);
}
