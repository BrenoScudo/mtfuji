package org.generation.italy.mtfuji.model.services.implementations;

import org.generation.italy.mtfuji.dto.BookingDTO;
import org.generation.italy.mtfuji.model.Booking;
import org.generation.italy.mtfuji.model.repositories.abstractions.BookingRepository;
import org.generation.italy.mtfuji.model.services.abstractions.BookingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class JpaBookingService implements BookingService {

    private final BookingRepository bookingRepository;

    @Autowired
    public JpaBookingService(BookingRepository bookingRepository) {
        this.bookingRepository = bookingRepository;
    }

    @Override
    public BookingDTO saveBooking(BookingDTO bookingDTO) {
        Booking booking = mapToEntity(bookingDTO);
        booking = bookingRepository.save(booking);
        return mapToDTO(booking);
    }

    @Override
    public List<BookingDTO> findAllBookings() {
        return bookingRepository.findAll().stream()
                .map(this::mapToDTO)
                .collect(Collectors.toList());
    }

    @Override
    public BookingDTO findBookingById(Long id) {
        Booking booking = bookingRepository.findById(id).orElse(null);
        return booking != null ? mapToDTO(booking) : null;
    }

    @Override
    public BookingDTO updateBookingById(Long id, BookingDTO bookingDTO) {
        Booking booking = bookingRepository.findById(id).orElseThrow(() -> new IllegalArgumentException("Prenotazione non trovata"));
        booking.setUser(bookingDTO.getUser());
        booking.setQuantity(bookingDTO.getQuantity());
        booking.setCheck_in(bookingDTO.getCheck_in());
        booking.setCheck_out(bookingDTO.getCheck_out());
        booking.setReservation_date(bookingDTO.getReservation_date());
        booking.setRoom(bookingDTO.getRoom());
        booking.setPaid(bookingDTO.isPaid());
        booking.setCost(bookingDTO.getCost());
        booking.setIs_promotion(bookingDTO.isIs_promotion());
        booking = bookingRepository.save(booking);
        return mapToDTO(booking);
    }

    @Override
    public void deleteBookingById(Long id) {
        bookingRepository.deleteById(id);
    }

    private Booking mapToEntity(BookingDTO bookingDTO) {
        Booking booking = new Booking();
        booking.setId(bookingDTO.getId());
        booking.setUser(bookingDTO.getUser());
        booking.setQuantity(bookingDTO.getQuantity());
        booking.setCheck_in(bookingDTO.getCheck_in());
        booking.setCheck_out(bookingDTO.getCheck_out());
        booking.setReservation_date(bookingDTO.getReservation_date());
        booking.setRoom(bookingDTO.getRoom());
        booking.setPaid(bookingDTO.isPaid());
        booking.setCost(bookingDTO.getCost());
        booking.setIs_promotion(bookingDTO.isIs_promotion());
        return booking;
    }

    private BookingDTO mapToDTO(Booking booking) {
        BookingDTO bookingDTO = new BookingDTO();
        bookingDTO.setId(booking.getId());
        bookingDTO.setUser(booking.getUser());
        bookingDTO.setQuantity(booking.getQuantity());
        bookingDTO.setCheck_in(booking.getCheck_in());
        bookingDTO.setCheck_out(booking.getCheck_out());
        bookingDTO.setReservation_date(booking.getReservation_date());
        bookingDTO.setRoom(booking.getRoom());
        bookingDTO.setPaid(booking.isPaid());
        bookingDTO.setCost(booking.getCost());
        bookingDTO.setIs_promotion(booking.isIs_promotion());
        return bookingDTO;

    }

}
