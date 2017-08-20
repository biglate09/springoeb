package com.springoeb.stock.repository;

import com.springoeb.stock.model.MaterialCategory;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface MaterialCategoryRepository extends CrudRepository<MaterialCategory,Integer> {
    List<MaterialCategory> findAll();
    void removeByMatCatNo(int matCatNo);
    MaterialCategory findByMatCatNo(int matCatNo);
    List<MaterialCategory> findByMatCatNameIgnoreCase(String matCatName);
}