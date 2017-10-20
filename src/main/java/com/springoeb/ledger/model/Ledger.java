package com.springoeb.ledger.model;

import javax.persistence.*;
import java.sql.Date;

@Entity(name = "ledger")
public class Ledger {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "ledgerNo")
    private Integer ledgerNo;
    @Column(name = "ledgerDesc")
    private String ledgerDesc;
    @Column(name = "ledgerTypeNo",updatable = true,insertable = true)
    private Integer ledgerTypeNo;
    @Column(name = "amount")
    private Double amount;
    @Column(name = "date")
    private Date date;
    @Column(name = "branchNo")
    private Integer branchNo;

    public Integer getBranchNo() {
        return branchNo;
    }

    public void setBranchNo(Integer branchNo) {
        this.branchNo = branchNo;
    }

    @ManyToOne
    @JoinColumn(name = "ledgerTypeNo",updatable = false,insertable = false)
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