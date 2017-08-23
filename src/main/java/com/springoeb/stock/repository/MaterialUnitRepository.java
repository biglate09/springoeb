package com.springoeb.stock.repository;

import com.springoeb.stock.model.MaterialUnit;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface MaterialUnitRepository extends CrudRepository<MaterialUnit,Integer>{
    List<MaterialUnit> findAll();
    void removeByUnitNo(int unitNo);
    MaterialUnit findByUnitNo(int unitNo);
    List<MaterialUnit> findByUnitNameIgnoreCase(String unitName);
}
