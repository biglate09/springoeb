package com.springoeb.branch.repository;

import com.springoeb.branch.model.Branch;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BranchRepository extends CrudRepository<Branch,Integer>{
    List<Branch> findAll();
    Branch findByBranchNo(int branchNo);
}