package com.springoeb.ledger.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class LedgerPay {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer ledgerPayNo;
    private String ledgerPayName;

    public Integer getLedgerPayNo() {
        return ledgerPayNo;
    }

    public void setLedgerPayNo(Integer ledgerPayNo) {
        this.ledgerPayNo = ledgerPayNo;
    }

    public String getLedgerPayName() {
        return ledgerPayName;
    }

    public void setLedgerPayName(String ledgerPayName) {
        this.ledgerPayName = ledgerPayName;
    }
}
