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
    public List<MaterialItem> getMaterialItems(int restNo){
        return materialItemRepository.findByMatFlagAndRestNo(MaterialItem.flagForItem,restNo);
    }
    public List<MaterialItem> getMixedProducts(int restNo){
        return materialItemRepository.findByMatFlagAndRestNo(MaterialItem.flagForMixed, restNo);
    }

    public List<MaterialItem> getAllMaterials(int restNo){
        return materialItemRepository.findByRestNo(restNo);
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
