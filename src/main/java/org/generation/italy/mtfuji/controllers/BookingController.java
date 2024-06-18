package org.generation.italy.mtfuji.controllers;

import org.generation.italy.mtfuji.dto.BookingDTO;
import org.generation.italy.mtfuji.model.Booking;
import org.generation.italy.mtfuji.model.services.abstractions.BookingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/booking")
public class BookingController {

    private final BookingService bookingService;

    @Autowired
    public BookingController(BookingService bookingService) {
        this.bookingService = bookingService;
    }

    @PostMapping
    public ResponseEntity<BookingDTO> createBooking(@RequestBody BookingDTO bookingDTO) {
        Booking booking = bookingDTO.toBooking();
        Booking createdBooking = bookingService.saveBooking(booking);
        BookingDTO dto = new BookingDTO(createdBooking);
        return new ResponseEntity<>(dto, HttpStatus.CREATED);
    }

    @PutMapping("/{id}")
    public ResponseEntity<BookingDTO> updateBooking(@PathVariable Long id, @RequestBody BookingDTO bookingDTO) {
        Booking booking = bookingDTO.toBooking();
        Booking updatedBooking = bookingService.updateBookingById(id, booking);
        BookingDTO updatedDTO = new BookingDTO(updatedBooking);
        return new ResponseEntity<>(updatedDTO, HttpStatus.OK);
    }

    @GetMapping("/{id}")
    public ResponseEntity<BookingDTO> getBooking(@PathVariable Long id) {
        Optional<Booking> optBook = bookingService.findBookingById(id);
        if(optBook.isEmpty()){
            return ResponseEntity.notFound().build();
        }
        BookingDTO dto = new BookingDTO(optBook.get());
        return ResponseEntity.ok(dto);
    }

    @GetMapping()
    public ResponseEntity<List<BookingDTO>> getAllBookings() {
        List<Booking> bookings = bookingService.findAllBookings();
        List<BookingDTO> dtos = bookings.stream().map(BookingDTO::new).toList();
        return new ResponseEntity<>(dtos, HttpStatus.OK);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteBooking(@PathVariable Long id) {
        bookingService.deleteBookingById(id);
        return new ResponseEntity<>(HttpStatus.NO_CONTENT);
    }
}
