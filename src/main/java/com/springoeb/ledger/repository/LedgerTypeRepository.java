package com.springoeb.ledger.repository;

import com.springoeb.ledger.model.LedgerType;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface LedgerTypeRepository extends CrudRepository<LedgerType,Integer>{
    List<LedgerType> findByDefaultType(boolean defaultType);
    LedgerType findByLedgerTypeNo(int ledgerTypeNo);
    void removeByLedgerTypeNo(int ledgerTypeNo);
}
