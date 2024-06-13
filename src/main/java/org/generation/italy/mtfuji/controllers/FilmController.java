package org.generation.italy.mtfuji.controllers;


import org.generation.italy.mtfuji.model.Film;
import org.generation.italy.mtfuji.model.services.abstractions.FilmService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/films")
public class FilmController {

    private final FilmService filmService;

    @Autowired
    public FilmController(FilmService filmService) {
        this.filmService = filmService;
    }

    @GetMapping
    public List<Film> getAllFilms(){
        return filmService.getAllFilms();
    }
}
