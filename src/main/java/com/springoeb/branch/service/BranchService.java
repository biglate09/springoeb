package com.springoeb.branch.service;

import com.springoeb.branch.model.Branch;
import com.springoeb.branch.repository.BranchRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BranchService {
    @Autowired
    private BranchRepository branchRepository;
    public Branch getBranch(int branchNo){
        return branchRepository.findByBranchNo(branchNo);
    }
    public List<Branch> getAllBranches(){
        return branchRepository.findAll();
    }
    public void removeByBranchNo(int branchNo){
        branchRepository.removeByBranchNo(branchNo);
    }
    public Branch save(Branch branch){
        return branchRepository.save(branch);
    }
}