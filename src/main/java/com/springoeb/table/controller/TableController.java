package com.springoeb.table.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.springoeb.system.model.BranchUser;
import com.springoeb.table.model.Reservation;
import com.springoeb.table.model.Table;
import com.springoeb.table.service.ReservationService;
import com.springoeb.table.service.TableService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;
import java.sql.Date;
import java.sql.Time;
import java.util.List;

@RequestMapping("/table")
@Controller
public class TableController {
    @Autowired
    private TableService tableService;
    @Autowired
    private ReservationService reservationService;
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

    @PostMapping("/getreservations/{todayInput}")
    @ResponseBody
    public String getReservations(@PathVariable("todayInput") boolean todayInput, HttpSession session) throws JsonProcessingException {
        int branchNo = ((BranchUser) (session.getAttribute("branchUser"))).getBranchNo();
        List<Reservation> reservations = null;
        if(todayInput){
            reservations = reservationService.findReservedToday(branchNo);
        }else {
            reservations = reservationService.findReserved(branchNo);
        }
        ObjectMapper mapper = new ObjectMapper();
        String json = mapper.writeValueAsString(reservations);
        return json;
    }

    @PutMapping("/getreservation/{reserveNo}")
    @ResponseBody
    public String getReservation(@PathVariable("reserveNo") int reserveNo, HttpSession session) throws JsonProcessingException {
        Reservation reservation = reservationService.findByReserveNo(reserveNo);
        ObjectMapper mapper = new ObjectMapper();
        String json = mapper.writeValueAsString(reservation);
        return json;
    }

    @PostMapping("/managereservation")
    @ResponseBody
    public void addOrEditReservation(@ModelAttribute("reservation") Reservation reservation, HttpSession session,HttpServletRequest request){
        int branchNo = ((BranchUser) (session.getAttribute("branchUser"))).getBranchNo();
        reservation.setBranchNo(branchNo);
        reservation.setDate(Date.valueOf(request.getParameter("dateformat")));
        reservation.setTime(Time.valueOf(request.getParameter("timeformat").substring(0,5) + ":00"));
        System.out.println(reservation);
        reservationService.save(reservation);
    }

    @Transactional
    @DeleteMapping("/delreservation/{reservationNo}")
    @ResponseBody
    public void delReservation(@PathVariable("reservationNo") int reservationNo,HttpSession session) throws JsonProcessingException {
        reservationService.removeReservation(reservationNo);
    }
    //-----------------------------------------------------------------------------------------------------------//
}
