package com.springoeb.employee.repository;

import com.springoeb.employee.model.WorkHistory;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import javax.persistence.NamedQueries;
import java.util.List;

/**
 * Created by bighead on 6/9/17.
 */
@Repository
public interface WorkHistoryRepository extends CrudRepository<WorkHistory,Integer>{
    List<WorkHistory> findByEmployee_BranchNo(int branchNo);
    void removeByWorkHistNoAndEmployee_BranchNo(int workHistNo,int branchNo);
}