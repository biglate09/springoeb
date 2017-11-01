package com.springoeb.ledger.model;

import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.*;
import java.util.List;

@Entity(name = "LedgerType")
public class LedgerType {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "ledgerTypeNo")
    private Integer ledgerTypeNo;
    @Column(name = "ledgerTypeName")
    private String ledgerTypeName;
    @Column(name = "defaultType")
    private boolean defaultType;
    @Column(name = "ledgerPayNo")
    private int ledgerPayNo;
    @Column(name = "restNo")
    private int restNo;

    @JsonIgnore
    @OneToMany(fetch = FetchType.LAZY, mappedBy = "ledgerType")
    private List<Ledger> ledgers;

    @ManyToOne
    @JoinColumn(name = "ledgerPayNo",updatable = false,insertable = false)
    private LedgerPay ledgerPay;

    public static int PROFIT = 1;
    public static int EMPLOYEE = 2;
    public static int MATERIAL = 2;

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

    public int getRestNo() {
        return restNo;
    }

    public void setRestNo(int restNo) {
        this.restNo = restNo;
    }

    public List<Ledger> getLedgers() {
        return ledgers;
    }

    public void setLedgers(List<Ledger> ledgers) {
        this.ledgers = ledgers;
    }

    public LedgerPay getLedgerPay() {
        return ledgerPay;
    }

    public void setLedgerPay(LedgerPay ledgerPay) {
        this.ledgerPay = ledgerPay;
    }
}
