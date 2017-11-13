package com.springoeb.menu.repository;

import com.springoeb.menu.model.AddOn;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AddOnRepository extends CrudRepository<AddOn,Integer> {
    AddOn findByMenuNoAndMatNo(int menuNo,int matNo);
    AddOn findByAddOnNo(int addOnNo);
    void removeByMenuNoAndMatNo(int menuNo,int matNo);
}