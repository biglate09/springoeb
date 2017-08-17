package com.springoeb.stock.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.springoeb.menu.model.Menu;
import com.springoeb.menu.model.MenuCategory;
import com.springoeb.stock.service.StockCategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;
import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

@RequestMapping("/stock")
@Controller
public class StockController {
    @Autowired
    private StockCategoryService stockCategoryService;

    private static final String STOCK_PATH = "/WEB-INF/stock/";

    //-----------------------------------------------------------------------------------------------------------//
    @GetMapping("/stock")
    public String toStockIndex(Model model) {
        List<StockCategory> stockCategories = stockCategoryService.getStockCategories();
        model.addAttribute("stockCategories", stockCategories);
        return STOCK_PATH + "stock.jsp";
    }

    @ResponseBody
    @PostMapping("/getstocks/{stockCatNo}")
    public String getStocks(@PathVariable("stockCatNo") int stockCatNo, Model model) throws JsonProcessingException {
        List<Stock> stocks = stockService.getStocks();

        if (stockCatNo != 0) {
            stocks = stockService.getStocksByStockCategory(stockCatNo);
        }

        ObjectMapper mapper = new ObjectMapper();
        String json = mapper.writeValueAsString(stocks);
        return json;
    }

    @ResponseBody
    @PostMapping("/managestock")
    public void addAndEditStock(@RequestParam("stockPicPath") MultipartFile file, HttpServletRequest request) throws Exception {
        Stock stock = new Stock();
        byte[] bytes = file.getBytes();
        Integer stockNo = request.getParameter("stockNo") != null ? Integer.parseInt(request.getParameter("stockNo")) : null;

        if (stockNo != null) {
            stock = stockService.getStockByStockNo(stockNo);
            stock.setStockNo(stockNo);
        }

        stock.setStockNameTH(request.getParameter("stockNameTH"));
        stock.setStockNameEN(request.getParameter("stockNameEN"));
        stock.setStockPrice(Double.parseDouble(request.getParameter("stockPrice")));
        stock.setStockDesc(request.getParameter("stockDesc"));
        stock.setStockCatNo(Integer.parseInt(request.getParameter("stockCatNo")));
        stock.setAvailable(request.getParameter("stockAvailable") == null ? false : true);
        if (stockNo != null) {
            stock.setStockNo(stockNo);
        }

        if (!stockService.chkDuplicateStock(stock)) {
            if (!file.getOriginalFilename().equals("")) {
                String stockPicPath = null;
                if(stockNo != null) {
                    Stock tmpStock = stockService.getStockByStockNo(stockNo);
                    if (tmpStock != null) {
                        stockService.getStockByStockNo(stockNo).getStockPicPath();
                    }
                }
                //pic path before change
                String filename = System.currentTimeMillis() + file.getOriginalFilename();
                Path path = Paths.get(UPLOADED_FOLDER + filename);
                Files.write(path, bytes);
                stock.setStockPicPath(filename);
                if (stockNo != null) {
                    File picFile = new File(UPLOADED_FOLDER + "/" + stockPicPath);
                    picFile.delete();
                }
            }
            stockService.save(stock);
        } else {
            throw new Exception();
        }
    }

    @ResponseBody
    @PostMapping("/changeavailable")
    public void changeAvailable(HttpServletRequest request) {
        Stock stock = stockService.getStockByStockNo(Integer.parseInt(request.getParameter("stockno")));
        stock.setAvailable(!stock.getAvailable());
        stockService.save(stock);
    }

    @Transactional
    @ResponseBody
    @DeleteMapping("/delstock/{stockNo}")
    public void delStock(@PathVariable("stockNo") int stockNo) {
        String stockPicPath = stockService.getStockByStockNo(stockNo).getStockPicPath();
        stockService.delStock(stockNo);
        File file = new File(UPLOADED_FOLDER + "/" + stockPicPath);
        file.delete();
    }

    @ResponseBody
    @PutMapping("/getstock/{stockNo}")
    public String getStock(@PathVariable("stockNo") int stockNo) throws JsonProcessingException {
        Stock stock = stockService.getStockByStockNo(StockNo);
        ObjectMapper mapper = new ObjectMapper();
        String json = mapper.writeValueAsString(stock);
        return json;
    }

    //-----------------------------------------------------------------------------------------------------------//
}
