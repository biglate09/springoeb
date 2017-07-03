package com.springoeb.employee.model;

import javax.persistence.*;
import java.io.Serializable;
import java.sql.Date;
import java.sql.Time;

/**
 * Created by bighead on 6/9/17.
 */
@Entity
public class EmployeeTable implements Serializable{
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int empTimeNo;
    private Date date;
    private Time timeStart;
    private Time timeEnd;

    @Column(name = "emp_pos_no",updatable = true,insertable = true)
    private int empPosNo;
    @Column(name = "emp_no",updatable = true,insertable = true)
    private int empNo;
    @ManyToOne
    @JoinColumn(name = "emp_pos_no",updatable = false,insertable = false)
    private EmployeePosition employeePosition;

    @ManyToOne
    @JoinColumn(name = "emp_no",updatable = false,insertable = false)
    private Employee employee;

    @OneToOne(fetch = FetchType.LAZY, mappedBy = "employeeTable")
    private WorkHistory workHistory;

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

    public int getEmpPosNo() {
        return empPosNo;
    }

    public void setEmpPosNo(int empPosNo) {
        this.empPosNo = empPosNo;
    }

    public int getEmpNo() {
        return empNo;
    }

    public void setEmpNo(int empNo) {
        this.empNo = empNo;
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

    public WorkHistory getWorkHistory() {
        return workHistory;
    }

    public void setWorkHistory(WorkHistory workHistory) {
        this.workHistory = workHistory;
    }
}
