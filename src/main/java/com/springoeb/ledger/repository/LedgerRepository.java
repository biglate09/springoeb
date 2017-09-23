package com.springoeb.ledger.repository;

import com.springoeb.ledger.model.Ledger;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface LedgerRepository extends CrudRepository<Ledger,Integer>{
    List<Ledger> findByBranchNo(int branchNo);
    Ledger findByLedgerNo(int ledgerNo);
    void removeByLedgerNoAndBranchNo(int ledgerNo,int branchNo);
}
