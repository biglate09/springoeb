package com.springoeb.ledger.repository;

import com.springoeb.ledger.model.LedgerPay;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface LedgerPayRepository extends CrudRepository<LedgerPay,Integer>{

}
