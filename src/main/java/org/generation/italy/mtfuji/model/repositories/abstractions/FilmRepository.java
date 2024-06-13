package org.generation.italy.mtfuji.model.repositories.abstractions;

import org.generation.italy.mtfuji.model.Film;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface FilmRepository extends JpaRepository<Film,Long> {}
