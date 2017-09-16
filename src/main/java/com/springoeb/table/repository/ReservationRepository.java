package com.springoeb.table.repository;

import com.springoeb.table.model.Reservation;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.sql.Date;
import java.util.List;

@Repository
public interface ReservationRepository extends CrudRepository<Reservation,Integer>{
    List<Reservation> findByBranchNoAndStatusAndQueCodeIsNull(int branchNo,String status);
    List<Reservation> findByBranchNoAndDateAndStatusAndQueCodeIsNull(int branchNo, Date date, String status);
    Reservation findByReserveNo(int reserveNo);
    void removeByReserveNo(int reserveNo);
}
