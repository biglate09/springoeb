package com.springoeb.table.service;

import com.springoeb.table.model.Reservation;
import com.springoeb.table.repository.ReservationRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Date;
import java.util.List;

@Service
public class ReservationService {
    @Autowired
    private ReservationRepository reservationRepository;

    public List<Reservation> findReserved(int branchNo){
        return reservationRepository.findByBranchNoAndStatusAndQueCodeIsNull(branchNo,Reservation.RESERVED);
    }

    public List<Reservation> findReservedToday(int branchNo){
        return reservationRepository.findByBranchNoAndDateAndStatusAndQueCodeIsNull(branchNo,new Date(System.currentTimeMillis()),Reservation.RESERVED);
    }

    public Reservation findByReserveNo(int reserveNo){
        return reservationRepository.findByReserveNo(reserveNo);
    }

    public void save(Reservation reservation){
        reservationRepository.save(reservation);
    }

    public void removeReservation(int reservationNo){
        reservationRepository.removeByReserveNo(reservationNo);
    }
}
