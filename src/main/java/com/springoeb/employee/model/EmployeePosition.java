package com.springoeb.employee.model;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import java.util.List;

/**
 * Created by bighead on 6/9/17.
 */
@Entity
public class EmployeePosition {
    @Id
    private int emp_pos_no;
    private String emp_pos_name;
    @OneToMany(mappedBy = "employeePosition", cascade = CascadeType.ALL)
    private List<EmployeeTable> employeeTables;

    public int getEmp_pos_no() {
        return emp_pos_no;
    }

    public void setEmp_pos_no(int emp_pos_no) {
        this.emp_pos_no = emp_pos_no;
    }

    public String getEmp_pos_name() {
        return emp_pos_name;
    }

    public void setEmp_pos_name(String emp_pos_name) {
        this.emp_pos_name = emp_pos_name;
    }

    public List<EmployeeTable> getEmployeeTables() {
        return employeeTables;
    }

    public void setEmployeeTables(List<EmployeeTable> employeeTables) {
        this.employeeTables = employeeTables;
    }

    @Override
    public String toString() {
        return "EmployeePosition{" +
                "emp_pos_no=" + emp_pos_no +
                ", emp_pos_name='" + emp_pos_name + '\'' +
                ", employeeTables=" + employeeTables +
                '}';
    }
}
