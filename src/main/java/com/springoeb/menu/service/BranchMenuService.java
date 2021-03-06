package com.springoeb.menu.service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.springoeb.cashier.model.Order;
import com.springoeb.cashier.repository.OrderRepository;
import com.springoeb.menu.model.BranchMenu;
import com.springoeb.menu.model.Menu;
import com.springoeb.menu.model.MenuGroup;
import com.springoeb.menu.repository.BranchMenuRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;
import java.sql.Date;

@Service
public class BranchMenuService {
    @Autowired
    private BranchMenuRepository branchMenuRepository;
    @Autowired
    private OrderRepository orderRepository;

    public List<BranchMenu> getMenuSets(int branchNo) {
        return branchMenuRepository.findByBranchNoAndMenu_MenuFlagOrderByMenu_LocalFlagAsc(branchNo, Menu.flagForMenuSet);
    }

    public BranchMenu getMenuByMenuNo(int menuNo, int branchNo) {
        return branchMenuRepository.findByMenuNoAndBranchNo(menuNo, branchNo);
    }

    public BranchMenu save(BranchMenu branchMenu) {
        return branchMenuRepository.save(branchMenu);
    }


    public Set<BranchMenu> getMenusSubBranch(int branchNo) {
        return branchMenuRepository.findByMenu_MenuFlagAndBranchNoOrderByMenu_LocalFlagAscMenu_MenuGroup_MenuCatNoAscMenu_MenuGroupNoAsc(Menu.flagForMenu, branchNo);
    }

    public Set<BranchMenu> getMenusByMenuGroupSubBranch(int menuGroupNo, int branchNo) {
        if (menuGroupNo == MenuGroup.ALL_GROUP) {
            return branchMenuRepository.findByMenu_MenuFlagAndBranchNoOrderByMenu_LocalFlagAscMenu_MenuGroup_MenuCatNoAscMenu_MenuGroupNoAsc(Menu.flagForMenu, branchNo);
        } else {
            return branchMenuRepository.findByMenu_MenuGroupNoAndMenu_MenuFlagAndBranchNoOrderByMenu_LocalFlagAscMenu_MenuGroup_MenuCatNoAscMenu_MenuGroupNoAsc(menuGroupNo, Menu.flagForMenu, branchNo);
        }
    }

    public void save(List<BranchMenu> branchMenus) {
        branchMenuRepository.save(branchMenus);
    }

    public Map<String, Long> getBestSaleMenu(int branchNo, String fromDateUnformat, String toDateUnformat) throws JsonProcessingException {
        Map<String, Long> menuMaps = new LinkedHashMap<String, Long>();
        Date fromDate = null, toDate = null;
        if (!fromDateUnformat.equals("0") && !toDateUnformat.equals("0")) {
            fromDate = Date.valueOf(fromDateUnformat.substring(6, 10) + fromDateUnformat.substring(2, 5) + "-" + fromDateUnformat.substring(0, 2));
            toDate = Date.valueOf(toDateUnformat.substring(6, 10) + toDateUnformat.substring(2, 5) + "-" + toDateUnformat.substring(0, 2));
        }
        List<BranchMenu> branchMenus = branchMenuRepository.findByBranchNoAndMenu_MenuFlagOrderByMenu_LocalFlagAsc(branchNo, Menu.flagForMenu);
        for (BranchMenu bm : branchMenus) {
            int menuNo = bm.getMenuNo();
            Long sum = new Long(0);
            if (fromDate != null && toDate != null) {
                sum = orderRepository.sumByMenuNoAndDateIsBetween(menuNo, fromDate, toDate, Order.SERVED);
            }

            ObjectMapper mapper = new ObjectMapper();
            String json = mapper.writeValueAsString(bm.getMenu());
            menuMaps.put(json, sum == null ? 0 : sum);
        }
        return menuMaps;
    }

    public Map<String, Long> getBestSaleMenuSet(int branchNo, String fromDateUnformat, String toDateUnformat) throws JsonProcessingException {
        Map<String, Long> menuMaps = new LinkedHashMap<String, Long>();
        Date fromDate = null, toDate = null;

        if (!fromDateUnformat.equals("0") && !toDateUnformat.equals("0")) {
            fromDate = Date.valueOf(fromDateUnformat.substring(6, 10) + fromDateUnformat.substring(2, 5) + "-" + fromDateUnformat.substring(0, 2));
            toDate = Date.valueOf(toDateUnformat.substring(6, 10) + toDateUnformat.substring(2, 5) + "-" + toDateUnformat.substring(0, 2));
        }
        List<BranchMenu> branchMenus = branchMenuRepository.findByBranchNoAndMenu_MenuFlagOrderByMenu_LocalFlagAsc(branchNo, Menu.flagForMenuSet);
        for (BranchMenu bm : branchMenus) {
            int menuNo = bm.getMenuNo();
            Long sum = new Long(0);
            if (fromDate != null && toDate != null) {
                sum = orderRepository.sumByMenuNoAndDateIsBetween(menuNo, fromDate, toDate, Order.SERVED);
            }

            ObjectMapper mapper = new ObjectMapper();
            String json = mapper.writeValueAsString(bm.getMenu());
            menuMaps.put(json, sum == null ? 0 : sum);
        }
        return menuMaps;
    }

    public List<BranchMenu> getMenuByBranchNo(int branchNo) {
        return branchMenuRepository.findByBranchNoAndAvailable(branchNo, true);
    }

    public Map<Menu, Long> getBestSaleMenuObject(int branchNo,String fromDateUnformat,String toDateUnformat){
        Map<Menu, Long> menuMaps = new LinkedHashMap<Menu, Long>();
        List<BranchMenu> branchMenus = branchMenuRepository.findByBranchNoAndMenu_MenuFlagOrderByMenu_LocalFlagAsc(branchNo, Menu.flagForMenu);
        Date fromDate = null,toDate = null;
        if (!fromDateUnformat.equals("0") && !toDateUnformat.equals("0")) {
            fromDate = Date.valueOf(fromDateUnformat.substring(6, 10) + fromDateUnformat.substring(2, 5) + "-" + fromDateUnformat.substring(0, 2));
            toDate = Date.valueOf(toDateUnformat.substring(6, 10) + toDateUnformat.substring(2, 5) + "-" + toDateUnformat.substring(0, 2));
        }
        for (BranchMenu bm : branchMenus) {
            int menuNo = bm.getMenuNo();
            Long sum = new Long(0);
            if (fromDate != null && toDate != null) {
                sum = orderRepository.sumByMenuNoAndDateIsBetween(menuNo, fromDate, toDate, Order.SERVED);
            }
            menuMaps.put(bm.getMenu(), sum == null ? 0 : sum);
        }
        return menuMaps;
    }

    public Map<Menu, Long> getBestSaleMenuSetObject(int branchNo,String fromDateUnformat,String toDateUnformat){
        Map<Menu, Long> menuMaps = new LinkedHashMap<Menu, Long>();
        List<BranchMenu> branchMenus = branchMenuRepository.findByBranchNoAndMenu_MenuFlagOrderByMenu_LocalFlagAsc(branchNo, Menu.flagForMenuSet);
        Date fromDate = null,toDate = null;
        if (!fromDateUnformat.equals("0") && !toDateUnformat.equals("0")) {
            fromDate = Date.valueOf(fromDateUnformat.substring(6, 10) + fromDateUnformat.substring(2, 5) + "-" + fromDateUnformat.substring(0, 2));
            toDate = Date.valueOf(toDateUnformat.substring(6, 10) + toDateUnformat.substring(2, 5) + "-" + toDateUnformat.substring(0, 2));
        }
        for (BranchMenu bm : branchMenus) {
            int menuNo = bm.getMenuNo();
            Long sum = new Long(0);
            if (fromDate != null && toDate != null) {
                sum = orderRepository.sumByMenuNoAndDateIsBetween(menuNo, fromDate, toDate, Order.SERVED);
            }
            menuMaps.put(bm.getMenu(), sum == null ? 0 : sum);
        }
        return menuMaps;
    }
}
