package com.springoeb.stock.repository;

import com.springoeb.stock.model.MaterialHistory;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface MaterialHistoryRepository extends CrudRepository<MaterialHistory,Integer>{
}