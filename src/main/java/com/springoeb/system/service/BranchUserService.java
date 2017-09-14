package com.springoeb.system.service;

import com.springoeb.system.model.BranchUser;
import com.springoeb.system.repository.BranchUserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BranchUserService {
    @Autowired
    private BranchUserRepository branchUserRepository;

    public BranchUser findByUsername(String username){
        return branchUserRepository.findByUsernameIgnoreCase(username);
    }

    public void save(BranchUser branchUser){
        branchUserRepository.save(branchUser);
    }
}
