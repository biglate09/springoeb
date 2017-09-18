package com.springoeb.system.repository;

import com.springoeb.system.model.Role;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface RoleRepository extends CrudRepository<Role,Integer>{
    List<Role> findAll();
}
