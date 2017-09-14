package com.springoeb.system.service;

import com.springoeb.system.model.BranchUser;
import com.springoeb.system.repository.BranchUserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

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

    public List<BranchUser> findAll(){
        return branchUserRepository.findAll();
    }

    public List<BranchUser> findByPasswordIsNull(){
        return branchUserRepository.findByPasswordIsNull();
    }
}
