package com.springoeb.employee.model;

import org.springframework.stereotype.Component;

import javax.persistence.*;
import java.sql.Date;

/**
 * Created by bighead on 6/9/17.
 */
@Entity
public class EmployeePay {
    @Id
    private int empPayNo;
    private double pay;
    private Date date;

    @ManyToOne
    @JoinColumn(name = "empNo")
    private Employee employee;

    public int getEmpPayNo() {
        return empPayNo;
    }

    public void setEmpPayNo(int empPayNo) {
        this.empPayNo = empPayNo;
    }

    public double getPay() {
        return pay;
    }

    public void setPay(double pay) {
        this.pay = pay;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Employee getEmployee() {
        return employee;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
    }
}
