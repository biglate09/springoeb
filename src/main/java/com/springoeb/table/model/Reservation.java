package com.springoeb.table.model;

import javax.persistence.*;
import java.sql.Date;
import java.sql.Time;

@Entity(name = "Reservation")
public class Reservation {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "reserveNo")
    private Integer reserveNo;
    @Column(name = "date")
    private Date date;
    @Column(name = "time")
    private Time time;
    @Column(name = "numberOfPerson")
    private Integer numberOfPerson;
    @Column(name = "userNo")
    private Integer userNo;
    @Column(name = "userName")
    private String userName;
    @Column(name = "telNo")
    private String tel;
    @Column(name = "branchNo")
    private Integer branchNo;
    @Column(name = "queCode")
    private String queCode;

    public Integer getReserveNo() {
        return reserveNo;
    }

    public void setReserveNo(Integer reserveNo) {
        this.reserveNo = reserveNo;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Time getTime() {
        return time;
    }

    public void setTime(Time time) {
        this.time = time;
    }

    public Integer getNumberOfPerson() {
        return numberOfPerson;
    }

    public void setNumberOfPerson(Integer numberOfPerson) {
        this.numberOfPerson = numberOfPerson;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public Integer getBranchNo() {
        return branchNo;
    }

    public void setBranchNo(Integer branchNo) {
        this.branchNo = branchNo;
    }

    public Integer getUserNo() {
        return userNo;
    }

    public void setUserNo(Integer userNo) {
        this.userNo = userNo;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getQueCode() {
        return queCode;
    }

    public void setQueCode(String queCode) {
        this.queCode = queCode;
    }

    @Override
    public String toString() {
        return "Reservation{" +
                "reserveNo=" + reserveNo +
                ", date=" + date +
                ", time=" + time +
                ", numberOfPerson=" + numberOfPerson +
                ", userNo=" + userNo +
                ", userName='" + userName + '\'' +
                ", tel='" + tel + '\'' +
                ", branchNo=" + branchNo +
                '}';
    }
}
