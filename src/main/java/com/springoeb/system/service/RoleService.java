package com.springoeb.system.service;

import com.springoeb.system.model.Role;
import com.springoeb.system.repository.RoleRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RoleService {
    @Autowired
    private RoleRepository roleRepository;

    public List<Role> findAll(){
        return roleRepository.findAll();
    }

    public List<Role> findByCanAdd(){
        return roleRepository.findByCanAdd(true);
    }
}
