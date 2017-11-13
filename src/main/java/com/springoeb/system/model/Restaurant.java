package com.springoeb.system.model;

import javax.persistence.*;

@Entity(name = "Restaurant")
public class Restaurant {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "restNo")
    private Integer restNo;
    @Column(name = "restName")
    private String restName;
    @Column(name = "restDescription")
    private String restDescription;
    @Column(name = "restAddress")
    private String restAddress;
    @Column(name = "restNumber")
    private String restNumber;
    @Column(name = "restEmail")
    private String restEmail;
    @Column(name = "restPage")
    private String restPage;

    public Integer getRestNo() {
        return restNo;
    }

    public void setRestNo(Integer restNo) {
        this.restNo = restNo;
    }

    public String getRestName() {
        return restName;
    }

    public void setRestName(String restName) {
        this.restName = restName;
    }

    public String getRestDescription() {
        return restDescription;
    }

    public void setRestDescription(String restDescription) {
        this.restDescription = restDescription;
    }

    public String getRestAddress() {
        return restAddress;
    }

    public void setRestAddress(String restAddress) {
        this.restAddress = restAddress;
    }

    public String getRestNumber() {
        return restNumber;
    }

    public void setRestNumber(String restNumber) {
        this.restNumber = restNumber;
    }

    public String getRestEmail() {
        return restEmail;
    }

    public void setRestEmail(String restEmail) {
        this.restEmail = restEmail;
    }

    public String getRestPage() {
        return restPage;
    }

    public void setRestPage(String restPage) {
        this.restPage = restPage;
    }
}
