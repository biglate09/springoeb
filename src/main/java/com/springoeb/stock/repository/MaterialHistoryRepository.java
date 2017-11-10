package com.springoeb.stock.repository;

import com.springoeb.stock.model.MaterialHistory;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.sql.Date;
import java.util.List;

@Repository
public interface MaterialHistoryRepository extends CrudRepository<MaterialHistory,Integer>{
    List<MaterialHistory> findByBranchNo(int branchNo);
    List<MaterialHistory> findByMatItemNoAndBranchNoAndOfMatHistNoIsNullOrderByMatHistNoDesc(int matItemNo,int branchNo);
    MaterialHistory save(MaterialHistory materialHistory);
    @Query("select sum(mh.price) from MaterialHistory  mh where mh.date = ?1 and mh.branchNo = ?2")
    Double sumPriceByDate(Date date,int branchNo);
}
