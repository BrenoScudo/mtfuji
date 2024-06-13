package org.generation.italy.mtfuji.controllers;

import org.generation.italy.mtfuji.model.Beverage;
import org.generation.italy.mtfuji.model.Film;
import org.generation.italy.mtfuji.model.Food;
import org.generation.italy.mtfuji.model.Karaoke;
import org.generation.italy.mtfuji.model.services.abstractions.BeverageService;
import org.generation.italy.mtfuji.model.services.abstractions.FilmService;
import org.generation.italy.mtfuji.model.services.abstractions.FoodService;
import org.generation.italy.mtfuji.model.services.abstractions.KaraokeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/multimedia")
public class MultimediaController {

    private KaraokeService karaokeService;
    private FilmService filmService;

    public MultimediaController(KaraokeService karaokeService, FilmService filmService) {
        this.karaokeService = karaokeService;
        this.filmService = filmService;
    }

    @GetMapping("/film")
    public List<Film> getAllFilms(){
        return filmService.getAllFilms();
    }

    @GetMapping("/karaoke")
    public List<Karaoke> getAllKaraoke(){
        return karaokeService.getAllKaraoke();
    }
}
