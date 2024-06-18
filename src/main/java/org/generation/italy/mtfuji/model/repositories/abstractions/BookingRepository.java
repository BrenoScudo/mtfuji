package org.generation.italy.mtfuji.model.repositories.abstractions;

import org.generation.italy.mtfuji.model.Booking;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

@Repository
public interface BookingRepository extends JpaRepository<Booking, Long> {

    List<Booking> findByRoomIdAndCheckInBetween(long roomId, LocalDateTime startDate, LocalDateTime endDate);

}
