package com.springoeb.table.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/table")
@Controller
public class TableController {
    private static final String TABLE_PATH = "/WEB-INF/table/";

    //-----------------------------------------------------------------------------------------------------------//
    @GetMapping("/table")
    public String toTableIndex(){
        return TABLE_PATH + "table.jsp";
    }
    //-----------------------------------------------------------------------------------------------------------//
    @GetMapping("/reservation")
    public String toReservationIndex(){
        return TABLE_PATH + "reservation.jsp";
    }
    //-----------------------------------------------------------------------------------------------------------//
}
