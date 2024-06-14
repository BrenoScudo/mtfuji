package org.generation.italy.mtfuji.controllers;

import org.generation.italy.mtfuji.model.Karaoke;
import org.generation.italy.mtfuji.model.services.abstractions.KaraokeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/karaoke")
public class KaraokeController {

    private final KaraokeService karaokeService;

    @Autowired
    public KaraokeController(KaraokeService karaokeService) {
        this.karaokeService = karaokeService;
    }

    @GetMapping
    public List<Karaoke> getAllKaraoke() {
        return karaokeService.getAllKaraoke();
    }
}
