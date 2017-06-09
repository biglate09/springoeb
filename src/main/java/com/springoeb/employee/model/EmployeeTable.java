package com.springoeb.employee.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import java.sql.Date;
import java.sql.Time;

/**
 * Created by bighead on 6/9/17.
 */
@Entity
public class EmployeeTable {
    @Id
    private int empTimeNo;
    private Date date;
    private Time timeStart;
    private Time timeEnd;
    @ManyToOne
    @JoinColumn(name = "emp_pos_no")
    private EmployeePosition employeePosition;
    @ManyToOne
    @JoinColumn(name = "emp_no")
    private Employee employee;

    public int getEmpTimeNo() {
        return empTimeNo;
    }

    public void setEmpTimeNo(int empTimeNo) {
        this.empTimeNo = empTimeNo;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Time getTimeStart() {
        return timeStart;
    }

    public void setTimeStart(Time timeStart) {
        this.timeStart = timeStart;
    }

    public Time getTimeEnd() {
        return timeEnd;
    }

    public void setTimeEnd(Time timeEnd) {
        this.timeEnd = timeEnd;
    }

    public EmployeePosition getEmployeePosition() {
        return employeePosition;
    }

    public void setEmployeePosition(EmployeePosition employeePosition) {
        this.employeePosition = employeePosition;
    }

    public Employee getEmployee() {
        return employee;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
    }

    @Override
    public String toString() {
        return "EmployeeTable{" +
                "empTimeNo=" + empTimeNo +
                ", date=" + date +
                ", timeStart=" + timeStart +
                ", timeEnd=" + timeEnd +
                ", employeePosition=" + employeePosition +
                ", employee=" + employee +
                '}';
    }
}
