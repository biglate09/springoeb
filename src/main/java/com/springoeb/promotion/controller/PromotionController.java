package com.springoeb.promotion.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.springoeb.menu.service.MenuGroupService;
import com.springoeb.promotion.model.MenuGroupPromotion;
import com.springoeb.promotion.model.Promotion;
import com.springoeb.promotion.service.MenuGroupPromotionService;
import com.springoeb.promotion.service.PromotionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Date;
import java.util.LinkedList;
import java.util.List;

@RequestMapping("/promotion")
@Controller
public class PromotionController {
    private static final String PROMO_PATH = "/WEB-INF/promotion/";
    @Autowired
    private MenuGroupService menuGroupService;
    @Autowired
    private PromotionService promotionService;
    @Autowired
    private MenuGroupPromotionService menuGroupPromotionService;

    //-----------------------------------------------------------------------------------------------------------//
    @GetMapping("/promotion")
    public String toPromotionIndex(Model model) {
        model.addAttribute("menuGroups", menuGroupService.getMenuGroups());
        return PROMO_PATH + "promotion.jsp";
    }

    @ResponseBody
    @PutMapping("/getpromotion/{promotionNo}")
    public String getPromotion(@PathVariable("promotionNo") int promotionNo) throws JsonProcessingException {
        Promotion promotion = promotionService.findByPromotionNo(promotionNo);
        ObjectMapper mapper = new ObjectMapper();
        String json = mapper.writeValueAsString(promotion);
        return json;
    }

    @ResponseBody
    @PostMapping("/getpromotions")
    public String getPromotions(Model model) throws JsonProcessingException {
        List<Promotion> promotions = promotionService.findPromotions();
        ObjectMapper mapper = new ObjectMapper();
        String json = mapper.writeValueAsString(promotions);
        return json;
    }

    @Transactional
    @PostMapping("/managepromotion")
    @ResponseBody
    public void managePromotion(@RequestParam("promotionPicPath") MultipartFile file, HttpServletRequest request) throws IOException {
        Promotion promotion = null;
        if (!request.getParameter("promotionNo").equals("")) {
            promotion = promotionService.findByPromotionNo(Integer.parseInt(request.getParameter("promotionNo")));
        }
        promotion = getPromotion(request, promotion);

        //upload picture
        if (!file.getOriginalFilename().equals("")) {
            String filename = System.currentTimeMillis() + file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf('.'));
            String picPath = promotion.getPromotionPicPath();
            Path path = Paths.get(request.getServletContext().getRealPath("/images") + "/promotion/" + filename);
            byte[] bytes = file.getBytes();
            Files.write(path, bytes);
            promotion.setPromotionPicPath(filename);
            if (promotion.getPromotionNo() != null) {
                File picFile = new File(request.getServletContext().getRealPath("/images") + "/promotion/" + picPath);
                picFile.delete();
            }
        }

        promotionService.save(promotion);

        //manage menu_group_promotion
        menuGroupPromotionService.removeByPromotionNo(promotion.getPromotionNo());
        String[] menuGroupsNo = request.getParameterValues("table_records");
        LinkedList<MenuGroupPromotion> list = new LinkedList<MenuGroupPromotion>();
        for(String menuGroupNo : menuGroupsNo){
            MenuGroupPromotion menuGroupPromotion = new MenuGroupPromotion();
            menuGroupPromotion.setPromotionNo(promotion.getPromotionNo());
            menuGroupPromotion.setMenuGroupNo(Integer.parseInt(menuGroupNo));
            list.add(menuGroupPromotion);
        }

        menuGroupPromotionService.save(list);
    }

    private Promotion getPromotion(HttpServletRequest request, Promotion promotion) {
        if (promotion == null) {
            promotion = new Promotion();
        }
        promotion.setPromotionNo(request.getParameter("promotionNo").equals("") ? null : Integer.parseInt(request.getParameter("promotionNo")));
        promotion.setPromotionNameTH(request.getParameter("promotionNameTH"));
        promotion.setPromotionNameEN(request.getParameter("promotionNameEN"));
        promotion.setPromotionDesc(request.getParameter("promotionDesc"));
        promotion.setDiscount(Double.parseDouble(request.getParameter("discount")));
        String fromDate = request.getParameter("fromDate");
        String toDate = request.getParameter("toDate");
        promotion.setFromDate(Date.valueOf(fromDate.substring(6, 10) + "-" + fromDate.substring(3, 5) + "-" + fromDate.substring(0, 2)));
        promotion.setToDate(Date.valueOf(toDate.substring(6, 10) + "-" + toDate.substring(3, 5) + "-" + toDate.substring(0, 2)));
        promotion.setDay(request.getParameter("day"));
        promotion.setAvailable(request.getParameter("available") != null);
        return promotion;
    }

    @Transactional
    @ResponseBody
    @DeleteMapping("/deletepromotion/{promotionNo}")
    public void deletePromotion(@PathVariable("promotionNo") int promotionNo,HttpServletRequest request) {
        Promotion promotion = promotionService.removeByPromotionNo(promotionNo);
        String picPath = promotion.getPromotionPicPath();
        if(picPath != null) {
            File file = new File(request.getServletContext().getRealPath("/images") + "/promotion/" + picPath);
            file.delete();
        }
    }

    @ResponseBody
    @PostMapping("/changeavailable/{promotionNo}")
    public String changeAvailable(@PathVariable("promotionNo") int promotionNo) throws JsonProcessingException {
        Promotion promotion = promotionService.findByPromotionNo(promotionNo);
        promotion.setAvailable(!promotion.isAvailable());
        promotionService.save(promotion);
        ObjectMapper mapper = new ObjectMapper();
        String json = mapper.writeValueAsString(promotion);
        return json;
    }
    //-----------------------------------------------------------------------------------------------------------//
}
