package com.springoeb.system.repository;

import com.springoeb.system.model.Province;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProvinceRepository extends CrudRepository<Province,Integer>{
    List<Province> findAll();
    Province findByProvinceNo(int provinceNo);
}
