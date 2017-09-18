package com.springoeb.table.repository;

import com.springoeb.table.model.Reservation;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.sql.Date;
import java.util.List;

@Repository
public interface ReservationRepository extends CrudRepository<Reservation,Integer>{
    List<Reservation> findByBranchNoAndDateGreaterThanEqual(int branchNo,Date date);
    List<Reservation> findByBranchNoAndDate(int branchNo, Date date);
    Reservation findByReserveNo(int reserveNo);
    void removeByReserveNo(int reserveNo);
}
