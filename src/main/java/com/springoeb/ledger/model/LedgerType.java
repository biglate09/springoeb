package com.springoeb.ledger.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class LedgerType {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer ledgerTypeNo;
    private String ledgerTypeName;
    private boolean defaultType;
    private int ledgerPayNo;

    public static int INCOME = 1;
    public static int EXPENSE = 2;

    public Integer getLedgerTypeNo() {
        return ledgerTypeNo;
    }

    public void setLedgerTypeNo(Integer ledgerTypeNo) {
        this.ledgerTypeNo = ledgerTypeNo;
    }

    public String getLedgerTypeName() {
        return ledgerTypeName;
    }

    public void setLedgerTypeName(String ledgerTypeName) {
        this.ledgerTypeName = ledgerTypeName;
    }

    public boolean isDefaultType() {
        return defaultType;
    }

    public void setDefaultType(boolean defaultType) {
        this.defaultType = defaultType;
    }

    public int getLedgerPayNo() {
        return ledgerPayNo;
    }

    public void setLedgerPayNo(int ledgerPayNo) {
        this.ledgerPayNo = ledgerPayNo;
    }
}
