package org.generation.italy.mtfuji.model.services.abstractions;

import org.generation.italy.mtfuji.dto.BookingDTO;

import java.util.List;

public interface BookingService {
    BookingDTO saveBooking(BookingDTO bookingDTO);

    List<BookingDTO> findAllBookings();

    BookingDTO findBookingById(Long id);

    BookingDTO updateBookingById(Long id, BookingDTO bookingDTO);

    void deleteBookingById(Long id);
}
