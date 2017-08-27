package com.springoeb.stock.service;

import com.springoeb.stock.model.MaterialItem;
import com.springoeb.stock.repository.MaterialItemRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MaterialItemService {
    @Autowired
    private MaterialItemRepository materialItemRepository;
    public List<MaterialItem> getMaterialItems(){
        return materialItemRepository.findByMatFlag(MaterialItem.flagForItem);
    }
    public List<MaterialItem> getMixedProducts(){
        return materialItemRepository.findByMatFlag(MaterialItem.flagForMixed);
    }

    public List<MaterialItem> getAllMaterials(){
        return materialItemRepository.findAll();
    }

    public List<MaterialItem> getMaterials(){
        return materialItemRepository.findAll();
    }
    public MaterialItem save(MaterialItem matItem){ return materialItemRepository.save(matItem);}
    public void delMaterialItem(int matItemNo){ materialItemRepository.removeByMatItemNo(matItemNo);}
    public MaterialItem getMaterialItem(int matItemNo){
        return materialItemRepository.findByMatItemNo(matItemNo);
    }
    public boolean chkDuplicateMaterialItem(MaterialItem materialItem){
        List<MaterialItem> matItems = materialItemRepository.findByMatItemNameIgnoreCase(materialItem.getMatItemName());
        if(matItems != null && matItems.size() != 0){
            if(matItems.size() > 1) {
                return true;
            }else{
                if(materialItem.getMatItemNo() != null && matItems.get(0).getMatItemNo() == materialItem.getMatItemNo()){
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
