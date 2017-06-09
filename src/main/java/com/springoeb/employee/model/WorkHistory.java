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
public class WorkHistory {
    @Id
    private int workHistNo;
    private Date workStart;
    private Date workEnd;
    private double workPay;
    @ManyToOne
    @JoinColumn(name = "emp_no")
    private Employee employee;

    public int getWorkHistNo() {
        return workHistNo;
    }

    public void setWorkHistNo(int workHistNo) {
        this.workHistNo = workHistNo;
    }

    public Date getWorkStart() {
        return workStart;
    }

    public void setWorkStart(Date workStart) {
        this.workStart = workStart;
    }

    public Date getWorkEnd() {
        return workEnd;
    }

    public void setWorkEnd(Date workEnd) {
        this.workEnd = workEnd;
    }

    public double getWorkPay() {
        return workPay;
    }

    public void setWorkPay(double workPay) {
        this.workPay = workPay;
    }

    public Employee getEmployee() {
        return employee;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
    }

    @Override
    public String toString() {
        return "WorkHistory{" +
                "workHistNo=" + workHistNo +
                ", workStart=" + workStart +
                ", workEnd=" + workEnd +
                ", workPay=" + workPay +
                ", employee=" + employee +
                '}';
    }
}
