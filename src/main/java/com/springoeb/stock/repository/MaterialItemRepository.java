package com.springoeb.stock.repository;

import com.springoeb.stock.model.MaterialItem;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface MaterialItemRepository extends CrudRepository<MaterialItem,Integer> {
    List<MaterialItem> findByMatFlag(String materialFlag);
    void removeByMatItemNo(int matItemNo);
    MaterialItem findByMatItemNo(int matItemNo);
    List<MaterialItem> findByMatItemNameIgnoreCase(String matItemName);
}