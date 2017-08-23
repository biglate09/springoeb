package com.springoeb.stock.service;


import com.springoeb.stock.repository.MaterialHistoryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MaterialHistoryService {
    @Autowired
    private MaterialHistoryRepository materialHistoryRepository;

}
