package com.springoeb.employee.service;

import com.springoeb.employee.model.WorkHistory;
import com.springoeb.employee.repository.WorkHistoryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class WorkHistoryService {
    @Autowired
    public WorkHistoryRepository workHistoryRepository;

    public List<WorkHistory> findAll(){
        return workHistoryRepository.findAll();
    }
}
