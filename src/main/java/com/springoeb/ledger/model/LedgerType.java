package com.springoeb.ledger.model;

import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.*;
import java.util.List;

@Entity
public class LedgerType {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer ledgerTypeNo;
    private String ledgerTypeName;
    private boolean defaultType;
    private int ledgerPayNo;

    @JsonIgnore
    @OneToMany(fetch = FetchType.LAZY, mappedBy = "ledgerType")
    private List<Ledger> ledgers;

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
