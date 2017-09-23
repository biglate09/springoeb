package com.springoeb.ledger.service;

import com.springoeb.ledger.model.Ledger;
import com.springoeb.ledger.repository.LedgerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LedgerService {
    @Autowired
    private LedgerRepository ledgerRepository;

    public List<Ledger> findByBranchNo(int branchNo){
        return ledgerRepository.findByBranchNo(branchNo);
    }

    public void removeByLedgerNoAndBranchNo(int ledgerNo,int branchNo){
        ledgerRepository.removeByLedgerNoAndBranchNo(ledgerNo,branchNo);
    }

    public void save(Ledger ledger){
        ledgerRepository.save(ledger);
    }

    public Ledger findByLedgerNo(int ledgerNo){
        return ledgerRepository.findByLedgerNo(ledgerNo);
    }
}