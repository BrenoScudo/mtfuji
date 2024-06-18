package org.generation.italy.mtfuji.model.services.implementations;

import org.generation.italy.mtfuji.model.Booking;
import org.generation.italy.mtfuji.model.repositories.abstractions.BookingRepository;
import org.generation.italy.mtfuji.model.services.abstractions.BookingService;
import org.hibernate.grammars.hql.HqlParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
public class JpaBookingService implements BookingService {

    private final BookingRepository bookingRepository;

    @Autowired
    public JpaBookingService(BookingRepository bookingRepository) {
        this.bookingRepository = bookingRepository;
    }

    @Override
    public Booking saveBooking(Booking booking) {
        return bookingRepository.save(booking);
    }

    @Override
    public List<Booking> findAllBookings() {
        return new ArrayList<>(bookingRepository.findAll());
    }

    @Override
    public Optional<Booking> findBookingById(long id) {
        return bookingRepository.findById(id);
    }

    @Override
    public Booking updateBookingById(long id, Booking booking) {
        booking = bookingRepository.findById(id).orElseThrow(() -> new IllegalArgumentException("Prenotazione non trovata"));
        booking.setUser(booking.getUser());
        booking.setQuantity(booking.getQuantity());
        booking.setCheckIn(booking.getCheckIn());
        booking.setCheckOut(booking.getCheckOut());
        booking.setReservationDate(booking.getReservationDate());
        booking.setRoom(booking.getRoom());
        booking.setPaid(booking.isPaid());
        booking.setCost(booking.getCost());
        booking.setIsPromotion(booking.isIsPromotion());
        booking = bookingRepository.save(booking);
        return booking;
    }

    @Override
    public void deleteBookingById(long id) {
        bookingRepository.deleteById(id);
    }

    @Override
    public List<Booking> findBookingsByRoomIdAndDate(long id, LocalDate reservationDate) {
        LocalDateTime startOfDay = reservationDate.atStartOfDay();
        LocalDateTime endOfDay = reservationDate.atTime(LocalTime.MAX);
        return bookingRepository.findByRoomIdAndCheckInBetween(id, startOfDay, endOfDay);
    }
}
