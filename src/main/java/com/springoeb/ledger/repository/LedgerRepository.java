package com.springoeb.ledger.repository;

import com.springoeb.ledger.model.Ledger;
import org.springframework.data.jpa.repository.Query;
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
    @Query("select min(l.date) from Ledger l where branchNo = ?1")
    Date findMinLedgerDateByBranchNo(int branchNo);
    @Query("select max(l.date) from Ledger l where branchNo = ?1")
    Date findMaxLedgerDateByBranchNo(int branchNo);
    @Query("select sum(l.amount) from Ledger l join l.ledgerType lt where branchNo = ?1 and lt.ledgerPayNo = ?2")
    Double sumLedgerByBranchNoAndLedgerPayType(int branchNo,int ledgerPayNo);
}
