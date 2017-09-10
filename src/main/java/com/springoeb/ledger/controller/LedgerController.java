package com.springoeb.ledger.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/ledger")
@Controller
public class LedgerController {
    private static final String LEDGER_PATH = "/WEB-INF/ledger/";

    //-----------------------------------------------------------------------------------------------------------//
    @GetMapping("/ledgertype")
    public String toLedgerTypeIndex(){
        return LEDGER_PATH + "ledgertype.jsp";
    }
    //-----------------------------------------------------------------------------------------------------------//
    @GetMapping("/ledger")
    public String toLedgerIndex(){
        return LEDGER_PATH + "ledger.jsp";
    }
    //-----------------------------------------------------------------------------------------------------------//
}
