package com.springoeb.ledger.model;

import javax.persistence.*;
import java.sql.Date;

@Entity
public class Ledger {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer ledgerNo;
    private String ledgerDesc;
    @Column(name = "ledger_type_no",updatable = true,insertable = true)
    private Integer ledgerTypeNo;
    private Double amount;
    private Date date;
    private Integer branchNo;

    public Integer getBranchNo() {
        return branchNo;
    }

    public void setBranchNo(Integer branchNo) {
        this.branchNo = branchNo;
    }

    @ManyToOne
    @JoinColumn(name = "ledger_type_no",updatable = false,insertable = false)
    private LedgerType ledgerType;

    public Integer getLedgerNo() {
        return ledgerNo;
    }

    public void setLedgerNo(Integer ledgerNo) {
        this.ledgerNo = ledgerNo;
    }

    public String getLedgerDesc() {
        return ledgerDesc;
    }

    public void setLedgerDesc(String ledgerDesc) {
        this.ledgerDesc = ledgerDesc;
    }

    public Integer getLedgerTypeNo() {
        return ledgerTypeNo;
    }

    public void setLedgerTypeNo(Integer ledgerTypeNo) {
        this.ledgerTypeNo = ledgerTypeNo;
    }

    public Double getAmount() {
        return amount;
    }

    public void setAmount(Double amount) {
        this.amount = amount;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public LedgerType getLedgerType() {
        return ledgerType;
    }

    public void setLedgerType(LedgerType ledgerType) {
        this.ledgerType = ledgerType;
    }
}