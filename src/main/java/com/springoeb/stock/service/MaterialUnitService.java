package com.springoeb.stock.service;


import com.springoeb.stock.model.MaterialUnit;
import com.springoeb.stock.repository.MaterialUnitRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MaterialUnitService {
    @Autowired
    private MaterialUnitRepository materialUnitRepository;

    public List<MaterialUnit> getMaterialUnits(){
        return materialUnitRepository.findAll();
    }
    public void save(MaterialUnit materialUnit){ materialUnitRepository.save(materialUnit);}
    public void delMaterialUnit(int unitNo){ materialUnitRepository.removeByUnitNo(unitNo);}
    public MaterialUnit getMaterialUnit(int unitNo){
        return materialUnitRepository.findByUnitNo(unitNo);
    }
    public boolean chkDuplicateMaterialUnit(MaterialUnit materialUnit){
        List<MaterialUnit> unitegories = materialUnitRepository.findByUnitNameIgnoreCase(materialUnit.getUnitName());
        if(unitegories != null && unitegories.size() != 0){
            if(unitegories.size() > 1) {
                return true;
            }else{
                if(materialUnit.getUnitNo() != null && unitegories.get(0).getUnitNo() == materialUnit.getUnitNo()){
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
