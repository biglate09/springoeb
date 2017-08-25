package com.springoeb.stock.repository;

import com.springoeb.stock.model.MaterialHistory;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface MaterialHistoryRepository extends CrudRepository<MaterialHistory,Integer>{
    List<MaterialHistory> findByBranchNo(int branchNo);
}
