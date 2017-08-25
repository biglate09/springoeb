package com.springoeb.system.repository;

import com.springoeb.system.model.Branch;
import com.springoeb.system.model.BranchUser;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BranchRepository extends CrudRepository<Branch,Integer>{
    List<Branch> findAll();
}
