package com.springoeb.ledger.service;

import com.springoeb.ledger.repository.LedgerPayRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LedgerPayService {
    @Autowired
    private LedgerPayRepository ledgerTypeRepository;

}