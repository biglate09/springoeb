package com.springoeb.ledger.repository;

import com.springoeb.ledger.model.Ledger;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.sql.Date;
import java.util.List;

@Repository
public interface LedgerRepository extends CrudRepository<Ledger,Integer>{
    List<Ledger> findByBranchNo(int branchNo);
    List<Ledger> findByBranchNoAndDateIsBetween(int branchNo,Date fromDate,Date toDate);
    Ledger findByLedgerNo(int ledgerNo);
    void removeByLedgerNoAndBranchNo(int ledgerNo,int branchNo);
}
