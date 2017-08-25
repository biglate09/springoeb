package com.springoeb.system.service;

import com.springoeb.system.model.Branch;
import com.springoeb.system.repository.BranchRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BranchService {
    @Autowired
    private BranchRepository branchUserRepository;

    public List<Branch> getAllBranches(){ return branchUserRepository.findAll();}
}
