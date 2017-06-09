package com.springoeb.employee.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
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
    @JoinColumn(name = "emp_no")
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

    @Override
    public String toString() {
        return "EmployeePay{" +
                "empPayNo=" + empPayNo +
                ", pay=" + pay +
                ", date=" + date +
                ", employee=" + employee +
                '}';
    }
}
