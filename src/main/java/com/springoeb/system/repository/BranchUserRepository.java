package com.springoeb.system.repository;

import com.springoeb.system.model.BranchUser;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BranchUserRepository extends CrudRepository<BranchUser,Integer>{
    BranchUser findByUsernameIgnoreCase(String username);
    List<BranchUser> findAll();
    List<BranchUser> findByPasswordIsNull();
}
