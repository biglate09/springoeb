package com.springoeb.employee.model;

import javax.persistence.*;
import java.io.Serializable;
import java.sql.Date;
import java.sql.Time;

@Entity(name = "EmployeeTable")
public class EmployeeTable implements Serializable{
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "empTableNo")
    private Integer empTimeNo;
    @Column(name = "date")
    private Date date;
    @Column(name = "timeStart")
    private Time timeStart;
    @Column(name = "timeEnd")
    private Time timeEnd;

    @Column(name = "empPosNo",updatable = true,insertable = true)
    private Integer empPosNo;
    @Column(name = "empNo",updatable = true,insertable = true)
    private Integer empNo;
    @ManyToOne
    @JoinColumn(name = "empPosNo",updatable = false,insertable = false)
    private EmployeePosition employeePosition;

    @ManyToOne
    @JoinColumn(name = "empNo",updatable = false,insertable = false)
    private Employee employee;

    @OneToOne(fetch = FetchType.LAZY, mappedBy = "employeeTable")
    private WorkHistory workHistory;

    public WorkHistory getWorkHistory() {
        return workHistory;
    }

    public void setWorkHistory(WorkHistory workHistory) {
        this.workHistory = workHistory;
    }

    public Integer getEmpTimeNo() {
        return empTimeNo;
    }

    public void setEmpTimeNo(Integer empTimeNo) {
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

    public Integer getEmpPosNo() {
        return empPosNo;
    }

    public void setEmpPosNo(Integer empPosNo) {
        this.empPosNo = empPosNo;
    }

    public Integer getEmpNo() {
        return empNo;
    }

    public void setEmpNo(Integer empNo) {
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

}
