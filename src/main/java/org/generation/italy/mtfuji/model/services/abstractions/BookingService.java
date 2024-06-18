package org.generation.italy.mtfuji.model.services.abstractions;

import org.generation.italy.mtfuji.dto.BookingDTO;
import org.generation.italy.mtfuji.model.Booking;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

public interface BookingService {
    Booking saveBooking(Booking booking);

    List<Booking> findAllBookings();

    Optional<Booking> findBookingById(long id);

    Booking updateBookingById(long id, Booking booking);

    void deleteBookingById(long id);

    List<Booking> findBookingsByRoomIdAndDate(long id, LocalDate reservationDate);
}
