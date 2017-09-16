package com.springoeb.ledger.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.springoeb.ledger.model.LedgerType;
import com.springoeb.ledger.service.LedgerTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.transaction.Transactional;
import java.util.List;

@RequestMapping("/ledger")
@Controller
public class LedgerController {
    private static final String LEDGER_PATH = "/WEB-INF/ledger/";
    @Autowired
    private LedgerTypeService ledgerTypeService;

    //-----------------------------------------------------------------------------------------------------------//
    @GetMapping("/ledgertype")
    public String toLedgerTypeIndex(){
        return LEDGER_PATH + "ledgertype.jsp";
    }

    @PostMapping("/getledgertypes")
    @ResponseBody
    public String getledgerTypes() throws JsonProcessingException {
        List<LedgerType> ledgerTypes = ledgerTypeService.findAllNotDefault();
        ObjectMapper mapper = new ObjectMapper();
        String json = mapper.writeValueAsString(ledgerTypes);
        return json;
    }

    @PutMapping("/getledgertype/{ledgerTypeNo}")
    @ResponseBody
    public String getLedgerType(@PathVariable("ledgerTypeNo") int ledgerTypeNo) throws JsonProcessingException {
        LedgerType ledgerType = ledgerTypeService.findByLedgerTypeNo(ledgerTypeNo);
        ObjectMapper mapper = new ObjectMapper();
        String json = mapper.writeValueAsString(ledgerType);
        return json;
    }

    @PostMapping("manageledgertype")
    @ResponseBody
    public void manageLedgerType(@ModelAttribute("ledgerType") LedgerType ledgerType){
        ledgerType.setDefaultType(false);
        ledgerTypeService.save(ledgerType);
    }

    @Transactional
    @DeleteMapping("/deleteledgertype/{ledgerTypeNo}")
    @ResponseBody
    public void deleteLedgerType(@PathVariable("ledgerTypeNo") int ledgerTypeNo){
        ledgerTypeService.removeByLedgerTypeNo(ledgerTypeNo);
    }
    //-----------------------------------------------------------------------------------------------------------//
    @GetMapping("/ledger")
    public String toLedgerIndex(){
        return LEDGER_PATH + "ledger.jsp";
    }
    //-----------------------------------------------------------------------------------------------------------//
}
