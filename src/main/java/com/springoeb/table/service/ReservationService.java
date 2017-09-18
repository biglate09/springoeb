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
        return reservationRepository.findByBranchNoAndDateGreaterThanEqual(branchNo,new Date(System.currentTimeMillis()));
    }

    public List<Reservation> findReservedToday(int branchNo){
        return reservationRepository.findByBranchNoAndDate(branchNo,new Date(System.currentTimeMillis()));
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
