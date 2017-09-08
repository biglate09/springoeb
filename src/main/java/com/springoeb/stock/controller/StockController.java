package com.springoeb.stock.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.springoeb.stock.model.*;
import com.springoeb.stock.service.*;
import com.springoeb.system.model.BranchUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

@RequestMapping("/stock")
@Controller
public class StockController {
    @Autowired
    private MaterialCategoryService materialCategoryService;
    @Autowired
    private MaterialItemService materialItemService;
    @Autowired
    private MaterialHistoryService materialHistoryService;
    @Autowired
    private MaterialMixedService materialMixedService;
    @Autowired
    private MaterialUnitService materialUnitService;
    @Autowired
    private MenuMaterialService menuMaterialService;

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
        List<MaterialCategory> materialCategories = materialCategoryService.getMaterialCategories();
        List<MaterialUnit> materialUnits = materialUnitService.getMaterialUnits();
        model.addAttribute("matCategories", materialCategories);
        model.addAttribute("units", materialUnits);
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

    @Transactional
    @PostMapping("/managematerialitem")
    @ResponseBody
    public void addAndEditMaterialItem(@ModelAttribute("materialItem") MaterialItem materialItem, HttpServletRequest request) throws Exception {
        MaterialItem insertedMaterialItem = null;

        if (materialItem.getMatFlag().equals(MaterialItem.flagForItem)) {
            materialItem.setQuantity(1.0);
        }

        if (materialItem.getMatItemNo() != null) { // edit
            if (!materialItemService.getMaterialItem(materialItem.getMatItemNo()).equals(materialItem)) {
                if (!materialItemService.chkDuplicateMaterialItem(materialItem)) {
                    insertedMaterialItem = materialItemService.save(materialItem);
                } else {
                    throw new Exception();
                }
            } else {
                throw new Exception();
            }
        } else { // add
            if (!materialItemService.chkDuplicateMaterialItem(materialItem)) {
                insertedMaterialItem = materialItemService.save(materialItem);
            } else {
                throw new Exception();
            }
        }

        if (materialItem.getMatFlag().equals(MaterialItem.flagForMixed) && insertedMaterialItem != null) {
            materialMixedService.removeByMixedProdNo(insertedMaterialItem.getMatItemNo());
            Map<String, String[]> parameterMap = request.getParameterMap();
            List<MaterialMixed> materialMixeds = new LinkedList<MaterialMixed>();
            for (String key : parameterMap.keySet()) {
                if (key.indexOf("materialamount") != -1) {
                    String amount = parameterMap.get(key)[0];
                    if (amount != null && !amount.trim().equals("") && Double.parseDouble(amount) != 0) {
                        MaterialMixed mm = new MaterialMixed();
                        mm.setMixedProdNo(insertedMaterialItem.getMatItemNo());
                        mm.setItemNo(Integer.parseInt(key.substring("materialamount".length(), key.length())));
                        mm.setQuantity(Double.parseDouble(amount));
                        materialMixeds.add(mm);
                    }
                }
            }
            materialMixedService.save(materialMixeds);
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
    @GetMapping("/mixedproduct")
    public String toMixedProductIndex(Model model) {
        List<MaterialCategory> materialCategories = materialCategoryService.getMaterialCategories();
        List<MaterialUnit> materialUnits = materialUnitService.getMaterialUnits();
        List<MaterialItem> materialItems = materialItemService.getAllMaterials();
        model.addAttribute("materialItems", materialItems);
        model.addAttribute("matCategories", materialCategories);
        model.addAttribute("units", materialUnits);
        return STOCK_PATH + "mixedproduct.jsp";
    }

    @PostMapping("/getmixedproducts")
    @ResponseBody
    public String getMixedProducts() throws JsonProcessingException {
        List<MaterialItem> materialItems = materialItemService.getMixedProducts();
        ObjectMapper mapper = new ObjectMapper();
        String json = mapper.writeValueAsString(materialItems);
        return json;
    }

    //-----------------------------------------------------------------------------------------------------------//
    @GetMapping("/stockmanage")
    public String toStockManageIndex(Model model) {
        List<MaterialItem> materials = materialItemService.getMaterials();
        model.addAttribute("materials", materials);
        return STOCK_PATH + "stockmanage.jsp";
    }

    @PostMapping("/getmaterialhistories")
    @ResponseBody
    public String getMaterialHistories(HttpSession session) throws JsonProcessingException {
        int branchNo = ((BranchUser)(session.getAttribute("branchUser"))).getBranchNo();
        List<MaterialHistory> materialHistories = materialHistoryService.getMaterialHistories(branchNo);
        ObjectMapper mapper = new ObjectMapper();
        String json = mapper.writeValueAsString(materialHistories);
        return json;
    }

    @PostMapping("managematerialhistory")
    public void AddOrEditMaterialHistory(){

    }
    //-----------------------------------------------------------------------------------------------------------//
    @GetMapping("/materialunit")
    public String toMaterialUnitIndex() {
        return STOCK_PATH + "materialunit.jsp";
    }

    @PostMapping("/getmaterialunits")
    @ResponseBody
    public String getMaterialUnits() throws JsonProcessingException {
        List<MaterialUnit> materialUnits = materialUnitService.getMaterialUnits();
        ObjectMapper mapper = new ObjectMapper();
        String json = mapper.writeValueAsString(materialUnits);
        return json;
    }

    @PostMapping("/managematerialunit")
    @ResponseBody
    public void addAndEditMaterialUnit(@ModelAttribute("materialunit") MaterialUnit materialUnit) throws Exception {
        if (materialUnit.getUnitNo() != null) { // edit
            if (!materialUnitService.getMaterialUnit(materialUnit.getUnitNo()).equals(materialUnit)) {
                if (!materialUnitService.chkDuplicateMaterialUnit(materialUnit)) {
                    materialUnitService.save(materialUnit);
                } else {
                    throw new Exception();
                }
            } else {
                throw new Exception();
            }
        } else { // add
            if (!materialUnitService.chkDuplicateMaterialUnit(materialUnit)) {
                materialUnitService.save(materialUnit);
            } else {
                throw new Exception();
            }
        }
    }

    @Transactional
    @DeleteMapping("/deletematerialunit/{unitNo}")
    @ResponseBody
    public void delMaterialUnit(@PathVariable("unitNo") int unitNo) {
        materialUnitService.delMaterialUnit(unitNo);
    }

    @Transactional
    @PutMapping("/getmaterialunit/{unitNo}")
    @ResponseBody
    public String getMaterialUnit(@PathVariable("unitNo") int unitNo) throws JsonProcessingException {
        MaterialUnit materialUnit = materialUnitService.getMaterialUnit(unitNo);
        ObjectMapper mapper = new ObjectMapper();
        String json = mapper.writeValueAsString(materialUnit);
        return json;
    }
    //-----------------------------------------------------------------------------------------------------------//

    @GetMapping("/stockremain")
    public String toStockRemainIndex(Model model) {
        return STOCK_PATH + "stockremain.jsp";
    }


    //-----------------------------------------------------------------------------------------------------------//

}
