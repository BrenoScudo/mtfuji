package org.generation.italy.mtfuji.model.services.implementations;

import org.generation.italy.mtfuji.model.Film;
import org.generation.italy.mtfuji.model.repositories.abstractions.FilmRepository;
import org.generation.italy.mtfuji.model.repositories.abstractions.FoodRepository;
import org.generation.italy.mtfuji.model.services.abstractions.FilmService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class JpaFilmService implements FilmService {

    private final FilmRepository filmRepository;

    @Autowired
    public JpaFilmService(FilmRepository filmRepository) {
        this.filmRepository = filmRepository;
    }

    @Override
    public List<Film> getAllFilms() {
        return filmRepository.findAllByOrderByTitle();
    }

    @Override
    public Optional<Film> getFilmById(long id) {
        return filmRepository.findById(id);
    }

    @Override
    public List<Film> findByNameLike(String name) {
        return List.of();
    }
}
