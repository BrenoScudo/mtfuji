package org.generation.italy.mtfuji.controllers;


import org.generation.italy.mtfuji.dto.FilmDTO;
import org.generation.italy.mtfuji.model.Film;
import org.generation.italy.mtfuji.model.services.abstractions.FilmService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@RestController
@RequestMapping
public class FilmController {

    private final FilmService filmService;

    @Autowired
    public FilmController(FilmService filmService) {
        this.filmService = filmService;
    }

    @GetMapping("/films")
    public ResponseEntity<List<FilmDTO>> getAllFilms(){
        List<FilmDTO> filmsDto = filmService.getAllFilms().stream().map(FilmDTO::new).collect(Collectors.toList());
        return ResponseEntity.ok(filmsDto);
    }

    @GetMapping("film/{id}")
    public ResponseEntity<FilmDTO> getFilmById(@PathVariable("id") long filmId) {
        Optional<Film> oFilm = filmService.getFilmById(filmId);
        if(oFilm.isEmpty()) {
            return ResponseEntity.notFound().build();
        }
        Film f = oFilm.get();
        FilmDTO dto = new FilmDTO(f);
        return ResponseEntity.ok(dto);
    }
}
