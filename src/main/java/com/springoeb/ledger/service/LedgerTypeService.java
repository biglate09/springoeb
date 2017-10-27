package com.springoeb.ledger.service;

import com.springoeb.ledger.model.LedgerType;
import com.springoeb.ledger.repository.LedgerTypeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LedgerTypeService {
    @Autowired
    private LedgerTypeRepository ledgerTypeRepository;

    public List<LedgerType> findAllNotDefault(int restNo){
        return ledgerTypeRepository.findByDefaultTypeAndRestNo(false,restNo);
    }

    public LedgerType findByLedgerTypeNo(int ledgerTypeNo){
        return ledgerTypeRepository.findByLedgerTypeNo(ledgerTypeNo);
    }

    public void removeByLedgerTypeNo(int ledgerTypeNo){
        ledgerTypeRepository.removeByLedgerTypeNo(ledgerTypeNo);
    }

    public void save(LedgerType ledgerType){
        ledgerTypeRepository.save(ledgerType);
    }
}