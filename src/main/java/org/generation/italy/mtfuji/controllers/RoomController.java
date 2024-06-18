package org.generation.italy.mtfuji.controllers;

import org.generation.italy.mtfuji.dto.BookingDTO;
import org.generation.italy.mtfuji.model.Booking;
import org.generation.italy.mtfuji.model.Room;
import org.generation.italy.mtfuji.model.services.abstractions.BookingService;
import org.generation.italy.mtfuji.model.services.abstractions.RoomService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.time.LocalDate;
import java.util.List;

@RestController
@RequestMapping("/rooms")
public class RoomController {

    private final RoomService roomService;
    private final BookingService bookingService;

    @Autowired
    public RoomController(RoomService roomService, BookingService bookingService) {
        this.roomService = roomService;
        this.bookingService = bookingService;
    }

    @GetMapping
    public List<Room> getAllRooms(){
        return roomService.getAllRooms();
    }

    @GetMapping("/{id}/{date}/bookings")
    public ResponseEntity<List<BookingDTO>> getBookingsByRoomAndDate(@PathVariable long id, @PathVariable String date){
        LocalDate reservationDate = LocalDate.parse(date);
        List<Booking> result = bookingService.findBookingsByRoomIdAndDate(id, reservationDate);
        List<BookingDTO> dtos = result.stream().map(BookingDTO::new).toList();
        return ResponseEntity.ok(dtos);
    }
}
