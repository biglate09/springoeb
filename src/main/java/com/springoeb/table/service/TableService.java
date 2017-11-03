package com.springoeb.table.service;

import com.springoeb.table.model.Table;
import com.springoeb.table.repository.TableRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TableService {
    @Autowired
    private TableRepository tableRepository;

    public List<Table> getTables(int branchNo){
        return tableRepository.findByBranchNo(branchNo);
    }
    public List<Table> getTablesAvailable(int branchNo){
        return tableRepository.findByBranchNoAndIsAvailable(branchNo,true);
    }
    public void save(Table table){
        tableRepository.save(table);
    }
    public Table getTable(int tableNo,int branchNo){
        return tableRepository.findByTableNoAndBranchNo(tableNo,branchNo);
    }

    public void removeTable(int tableNo,int branchNo){
        tableRepository.removeByTableNoAndBranchNo(tableNo,branchNo);
    }
}
