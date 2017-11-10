package com.springoeb.stock.service;


import com.springoeb.stock.model.MaterialHistory;
import com.springoeb.stock.repository.MaterialHistoryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Date;
import java.util.List;

@Service
public class MaterialHistoryService {
    @Autowired
    private MaterialHistoryRepository materialHistoryRepository;
    public List<MaterialHistory> getMaterialHistories(int branchNo){
        return materialHistoryRepository.findByBranchNo(branchNo);
    }
    public List<MaterialHistory> getMaterialHistoriesByMaterialNo(int matNo,int branchNo){
        return materialHistoryRepository.findByMatItemNoAndBranchNoAndOfMatHistNoIsNullOrderByMatHistNoDesc(matNo,branchNo);
    }
    public MaterialHistory save(MaterialHistory materialHistory){
        return materialHistoryRepository.save(materialHistory);
    }

    public Double sumPriceByDate(Date date,int branchNo){
        return materialHistoryRepository.sumPriceByDate(date,branchNo);
    }
}
