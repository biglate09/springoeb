package com.springoeb.stock.service;


import com.springoeb.stock.model.MaterialCategory;
import com.springoeb.stock.repository.MaterialCategoryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MaterialCategoryService {
    @Autowired
    private MaterialCategoryRepository matCategoryRepository;
    public List<MaterialCategory> getMaterialCategories(int restNo){
        return matCategoryRepository.findByRestNo(restNo);
    }
    public void save(MaterialCategory matCategory){ matCategoryRepository.save(matCategory);}
    public void delMaterialCategory(int matCatNo){ matCategoryRepository.removeByMatCatNo(matCatNo);}
    public MaterialCategory getMaterialCategory(int matCatNo){
        return matCategoryRepository.findByMatCatNo(matCatNo);
    }
    public boolean chkDuplicateMaterialCategory(MaterialCategory materialCategory){
        List<MaterialCategory> matCategories = matCategoryRepository.findByMatCatNameIgnoreCase(materialCategory.getMatCatName());
        if(matCategories != null && matCategories.size() != 0){
            if(matCategories.size() > 1) {
                return true;
            }else{
                if(materialCategory.getMatCatNo() != null && matCategories.get(0).getMatCatNo() == materialCategory.getMatCatNo()){
                    return false;
                }else{
                    return true;
                }
            }
        }else{
            return false;
        }
    }
}
