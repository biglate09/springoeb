package com.springoeb.employee.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import java.io.Serializable;
import java.sql.Timestamp;

/**
 * Created by bighead on 6/9/17.
 */
@Entity
public class WorkHistory implements Serializable{
    @Id
    private int workHistNo;
    private Timestamp workStart;
    private Timestamp workEnd;
    private Double workPay;
    private Double workHour;
    @ManyToOne
    @JoinColumn(name = "emp_no")
    private Employee employee;

    public int getWorkHistNo() {
        return workHistNo;
    }

    public void setWorkHistNo(int workHistNo) {
        this.workHistNo = workHistNo;
    }

    public Timestamp getWorkStart() {
        return workStart;
    }

    public void setWorkStart(Timestamp workStart) {
        this.workStart = workStart;
    }

    public Timestamp getWorkEnd() {
        return workEnd;
    }

    public void setWorkEnd(Timestamp workEnd) {
        this.workEnd = workEnd;
    }

    public Double getWorkPay() {
        return workPay;
    }

    public void setWorkPay(Double workPay) {
        this.workPay = workPay;
    }

    public Double getWorkHour() {
        return workHour;
    }

    public void setWorkHour(Double workHour) {
        this.workHour = workHour;
    }

    public Employee getEmployee() {
        return employee;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
    }
}
