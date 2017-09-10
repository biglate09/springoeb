package com.springoeb.table.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.springoeb.system.model.BranchUser;
import com.springoeb.table.model.Table;
import com.springoeb.table.service.TableService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;
import java.util.List;

@RequestMapping("/table")
@Controller
public class TableController {
    @Autowired
    private TableService tableService;
    private static final String TABLE_PATH = "/WEB-INF/table/";

    //-----------------------------------------------------------------------------------------------------------//
    @GetMapping("/table")
    public String toTableIndex(){
        return TABLE_PATH + "table.jsp";
    }

    @PostMapping("/gettables")
    @ResponseBody
    public String getTables(HttpSession session) throws JsonProcessingException {
        int branchNo = ((BranchUser) (session.getAttribute("branchUser"))).getBranchNo();
        List<Table> tables = tableService.getTables(branchNo);
        ObjectMapper mapper = new ObjectMapper();
        String json = mapper.writeValueAsString(tables);
        return json;
    }

    @PostMapping("/managetable")
    @ResponseBody
    public void addOrEditTable(@ModelAttribute("table") Table table, HttpSession session){
        int branchNo = ((BranchUser) (session.getAttribute("branchUser"))).getBranchNo();
        table.setBranchNo(branchNo);
        table.setAvailable(true);
        tableService.save(table);
    }

    @PutMapping("/gettable/{tableNo}")
    @ResponseBody
    public String getTable(@PathVariable("tableNo") int tableNo,HttpSession session, HttpServletRequest request) throws JsonProcessingException {
        int branchNo = ((BranchUser) (session.getAttribute("branchUser"))).getBranchNo();
        Table table = tableService.getTable(tableNo,branchNo);
        ObjectMapper mapper = new ObjectMapper();
        String json = mapper.writeValueAsString(table);
        return json;
    }

    @Transactional
    @DeleteMapping("/deltable/{tableNo}")
    @ResponseBody
    public void delTable(@PathVariable("tableNo") int tableNo,HttpSession session) throws JsonProcessingException {
        int branchNo = ((BranchUser) (session.getAttribute("branchUser"))).getBranchNo();
        tableService.removeTable(tableNo,branchNo);
    }
    //-----------------------------------------------------------------------------------------------------------//
    @GetMapping("/reservation")
    public String toReservationIndex(){
        return TABLE_PATH + "reservation.jsp";
    }
    //-----------------------------------------------------------------------------------------------------------//
}
