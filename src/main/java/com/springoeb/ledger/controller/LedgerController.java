package com.springoeb.ledger.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.springoeb.ledger.model.Ledger;
import com.springoeb.ledger.model.LedgerType;
import com.springoeb.ledger.service.LedgerService;
import com.springoeb.ledger.service.LedgerTypeService;
import com.springoeb.system.model.BranchUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;
import java.sql.Date;
import java.util.List;

@RequestMapping("/ledger")
@Controller
public class LedgerController {
    private static final String LEDGER_PATH = "/WEB-INF/ledger/";
    @Autowired
    private LedgerTypeService ledgerTypeService;
    @Autowired
    private LedgerService ledgerService;

    //-----------------------------------------------------------------------------------------------------------//
    @GetMapping("/ledgertype")
    public String toLedgerTypeIndex(){
        return LEDGER_PATH + "ledgertype.jsp";
    }

    @PostMapping("/getledgertypes")
    @ResponseBody
    public String getledgerTypes(HttpSession session) throws JsonProcessingException {
        BranchUser branchUser = (BranchUser)(session.getAttribute("branchUser"));
        List<LedgerType> ledgerTypes = ledgerTypeService.findAllNotDefault(branchUser.getBranch().getRestNo());
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
    public void manageLedgerType(@ModelAttribute("ledgerType") LedgerType ledgerType, HttpSession session){
        BranchUser branchUser = (BranchUser)(session.getAttribute("branchUser"));
        ledgerType.setDefaultType(false);
        ledgerType.setRestNo(branchUser.getBranch().getRestNo());
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
    public String toLedgerIndex(Model model,HttpSession session){
        BranchUser branchUser = (BranchUser)(session.getAttribute("branchUser"));
        model.addAttribute("ledgerType",ledgerTypeService.findAllNotDefault(branchUser.getBranch().getRestNo()));
        return LEDGER_PATH + "ledger.jsp";
    }

    @PostMapping("/getledgers")
    @ResponseBody
    public String getLedgers(HttpSession session) throws JsonProcessingException {
        int branchNo = ((BranchUser)(session.getAttribute("branchUser"))).getBranchNo();
        List<Ledger> ledgers = ledgerService.findByBranchNo(branchNo);
        ObjectMapper mapper = new ObjectMapper();
        String json = mapper.writeValueAsString(ledgers);
        return json;
    }

    @Transactional
    @DeleteMapping("/deleteledger/{ledgerNo}")
    @ResponseBody
    public void deleteLedger(@PathVariable("ledgerNo") int ledgerNo,HttpSession session){
        int branchNo = ((BranchUser)(session.getAttribute("branchUser"))).getBranchNo();
        ledgerService.removeByLedgerNoAndBranchNo(ledgerNo,branchNo);
    }

    @PostMapping("/manageledger")
    @ResponseBody
    public void manageLedger(@ModelAttribute("ledger") Ledger ledger, HttpSession session, HttpServletRequest request){
        int branchNo = ((BranchUser)(session.getAttribute("branchUser"))).getBranchNo();
        String date = request.getParameter("date_unformat");
        LedgerType ledgerType = ledgerTypeService.findByLedgerTypeNo(ledger.getLedgerTypeNo());
        if(ledgerType.getLedgerPayNo() == LedgerType.EXPENSE){
            ledger.setAmount(-1 * ledger.getAmount());
        }
        ledger.setDate(Date.valueOf(date.substring(6, 10) + "-" + date.substring(3, 5) + "-" + date.substring(0, 2)));
        ledger.setBranchNo(branchNo);
        ledgerService.save(ledger);
    }

    @PutMapping("/getledger/{ledgerNo}")
    @ResponseBody
    public String getLedger(@PathVariable("ledgerNo") int ledgerNo) throws JsonProcessingException {
        Ledger ledger = ledgerService.findByLedgerNo(ledgerNo);
        ObjectMapper mapper = new ObjectMapper();
        String json = mapper.writeValueAsString(ledger);
        return json;
    }

    @PostMapping("/summaryledger")
    @ResponseBody
    public void summaryLedger(HttpSession session){
        int branchNo = ((BranchUser)(session.getAttribute("branchUser"))).getBranchNo();

    }
    //-----------------------------------------------------------------------------------------------------------//
}
