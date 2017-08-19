package com.springoeb.stock.controller;

import com.springoeb.menu.service.MenuCategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/stock")
@Controller
public class StockController {
    @Autowired
    private MenuCategoryService stockCategoryService;

    private static final String STOCK_PATH = "/WEB-INF/stock/";

//    //-----------------------------------------------------------------------------------------------------------//
//    @GetMapping("/stockcategory")
//    public String toStockIndex(Model model) {
//        return STOCK_PATH + "menucategory.jsp";
//    }
//
//    @PostMapping("/getstockcategories")
//    @ResponseBody
//    public String getMenuCategories() throws JsonProcessingException {
//        List<MenuGroup> menuCategories = stockCategoryService.getStockCategories();
//        ObjectMapper mapper = new ObjectMapper();
//        String json = mapper.writeValueAsString(menuCategories);
//        return json;
//    }
//
//    @PostMapping("/managestockcategory")
//    @ResponseBody
//    public void addAndEditStockCategory(@ModelAttribute("stockcategory") MenuGroup stockCategory) throws Exception {
//        if (stockCategory.getStockCatNo() != null) { // edit
//            if (!stockCategoryService.getStockCategory(stockCategory.getStockCatNo()).equals(stockCategory)) {
//                if (!stockCategoryService.chkDuplicateStockCat(stockCategory)) {
//                    stockCategoryService.save(stockCategory);
//                } else {
//                    throw new Exception();
//                }
//            } else {
//                throw new Exception();
//            }
//        } else { // add
//            if (!stockCategoryService.chkDuplicateStockCat(stockCategory)) {
//                stockCategoryService.save(stockCategory);
//            } else {
//                throw new Exception();
//            }
//        }
//    }
//
//    @Transactional
//    @DeleteMapping("/deletestockcategory/{stockCatNo}")
//    @ResponseBody
//    public void delStockCategory(@PathVariable("stockCatNo") int stockCatNo) {
//        stockCategoryService.delStockCategory(stockCatNo);
//    }
//
//    @Transactional
//    @PutMapping("/getstockcategory/{stockCatNo}")
//    @ResponseBody
//    public String getStockCategory(@PathVariable("stockCatNo") int stockCatNo) throws JsonProcessingException {
//        MenuGroup stockCategory = stockCategoryService.getStockCategory(stockCatNo);
//        ObjectMapper mapper = new ObjectMapper();
//        String json = mapper.writeValueAsString(stockCategory);
//        return json;
//    }
//    //-----------------------------------------------------------------------------------------------------------//
}
