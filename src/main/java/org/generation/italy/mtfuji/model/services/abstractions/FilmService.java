package org.generation.italy.mtfuji.model.services.abstractions;

import org.generation.italy.mtfuji.model.Film;

import java.util.List;
import java.util.Optional;

public interface FilmService {
    List<Film> getAllFilms();

    Optional<Film> getFilmById(long id);

    List<Film> findByNameLike(String name);
}
