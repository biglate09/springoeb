package com.springoeb.stock.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.springoeb.stock.model.MaterialCategory;
import com.springoeb.stock.model.MaterialItem;
import com.springoeb.stock.service.MaterialCategoryService;
import com.springoeb.stock.service.MaterialItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.transaction.Transactional;
import java.util.List;

@RequestMapping("/stock")
@Controller
public class StockController {
    @Autowired
    private MaterialCategoryService materialCategoryService;
    @Autowired
    private MaterialItemService materialItemService;

    private static final String STOCK_PATH = "/WEB-INF/stock/";

    //-----------------------------------------------------------------------------------------------------------//
    @GetMapping("/materialcategory")
    public String toMaterialCategoryIndex(Model model) {
        return STOCK_PATH + "materialcategory.jsp";
    }

    @PostMapping("/getmaterialcategories")
    @ResponseBody
    public String getMaterialCategories() throws JsonProcessingException {
        List<MaterialCategory> materialCategories = materialCategoryService.getMaterialCategories();
        ObjectMapper mapper = new ObjectMapper();
        String json = mapper.writeValueAsString(materialCategories);
        return json;
    }

    @PostMapping("/managematerialcategory")
    @ResponseBody
    public void addAndEditMaterialCategory(@ModelAttribute("materialcategory") MaterialCategory materialCategory) throws Exception {
        if (materialCategory.getMatCatNo() != null) { // edit
            if (!materialCategoryService.getMaterialCategory(materialCategory.getMatCatNo()).equals(materialCategory)) {
                if (!materialCategoryService.chkDuplicateMaterialCategory(materialCategory)) {
                    materialCategoryService.save(materialCategory);
                } else {
                    throw new Exception();
                }
            } else {
                throw new Exception();
            }
        } else { // add
            if (!materialCategoryService.chkDuplicateMaterialCategory(materialCategory)) {
                materialCategoryService.save(materialCategory);
            } else {
                throw new Exception();
            }
        }
    }

    @Transactional
    @DeleteMapping("/deletematerialcategory/{matCatNo}")
    @ResponseBody
    public void delMaterialCategory(@PathVariable("matCatNo") int matCatNo) {
        materialCategoryService.delMaterialCategory(matCatNo);
    }

    @Transactional
    @PutMapping("/getmaterialcategory/{matCatNo}")
    @ResponseBody
    public String getMaterialCategory(@PathVariable("matCatNo") int matCatNo) throws JsonProcessingException {
        MaterialCategory materialCategory = materialCategoryService.getMaterialCategory(matCatNo);
        ObjectMapper mapper = new ObjectMapper();
        String json = mapper.writeValueAsString(materialCategory);
        return json;
    }
    //-----------------------------------------------------------------------------------------------------------//
    @GetMapping("/materialitem")
    public String toMaterialItem(Model model) {
        List<MaterialCategory> materialCategories  = materialCategoryService.getMaterialCategories();
        model.addAttribute("matCategories", materialCategories);
        return STOCK_PATH + "materialitem.jsp";
    }

    @PostMapping("/getmaterialitems")
    @ResponseBody
    public String getMaterialItems() throws JsonProcessingException {
        List<MaterialItem> materialItems = materialItemService.getMaterialItems();
        ObjectMapper mapper = new ObjectMapper();
        String json = mapper.writeValueAsString(materialItems);
        return json;
    }

    @PostMapping("/managematerialitem")
    @ResponseBody
    public void addAndEditMaterialItem(@ModelAttribute("materialItem") MaterialItem materialItem) throws Exception {
        if (materialItem.getMatItemNo() != null) { // edit
            if (!materialItemService.getMaterialItem(materialItem.getMatItemNo()).equals(materialItem)) {
                if (!materialItemService.chkDuplicateMaterialItem(materialItem)) {
                    materialItemService.save(materialItem);
                } else {
                    throw new Exception();
                }
            } else {
                throw new Exception();
            }
        } else { // add
            if (!materialItemService.chkDuplicateMaterialItem(materialItem)) {
                materialItemService.save(materialItem);
            } else {
                throw new Exception();
            }
        }
    }

    @Transactional
    @DeleteMapping("/delmaterialitem/{matItemNo}")
    @ResponseBody
    public void delMaterialItem(@PathVariable("matItemNo") int matItemNo) {
        materialItemService.delMaterialItem(matItemNo);
    }

    @Transactional
    @PutMapping("/getmaterialitem/{matItemNo}")
    @ResponseBody
    public String getMenuGroup(@PathVariable("matItemNo") int matItemNo) throws JsonProcessingException {
        MaterialItem materialItem = materialItemService.getMaterialItem(matItemNo);
        ObjectMapper mapper = new ObjectMapper();
        String json = mapper.writeValueAsString(materialItem);
        return json;
    }
    //-----------------------------------------------------------------------------------------------------------//
}
