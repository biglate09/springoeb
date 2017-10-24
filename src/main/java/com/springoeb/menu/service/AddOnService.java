package com.springoeb.menu.service;

import com.springoeb.menu.repository.AddOnRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AddOnService {
    @Autowired
    private AddOnRepository addOnRepository;


}
