package com.springoeb.table.repository;

import com.springoeb.table.model.Table;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TableRepository extends CrudRepository<Table,Integer>{
    List<Table> findByBranchNo(int branchNo);
    List<Table> findByBranchNoAndIsAvailable(int branchNo,boolean available);
    Table findByTableNoAndBranchNo(int tableNo,int branchNo);
    void removeByTableNoAndBranchNo(int tableNo,int branchNo);
}
