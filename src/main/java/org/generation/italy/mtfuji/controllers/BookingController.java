package org.generation.italy.mtfuji.controllers;

import org.generation.italy.mtfuji.model.services.abstractions.BookingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/booking")
public class BookingController {

    private final BookingService bookingService;

    @Autowired
    private BookingController(BookingService bookingService) {
        this.bookingService = bookingService;
    }
}
