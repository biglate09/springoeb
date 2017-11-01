package com.springoeb.ledger.model;

import javax.persistence.*;

@Entity(name = "LedgerPay")
public class LedgerPay {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "ledgerPayNo")
    private Integer ledgerPayNo;
    @Column(name = "ledgerPayName")
    private String ledgerPayName;

    public static int INCOME = 1;
    public static int EXPENSE = 2;

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
