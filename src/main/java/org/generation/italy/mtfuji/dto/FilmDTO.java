package org.generation.italy.mtfuji.dto;

import org.generation.italy.mtfuji.model.Film;

public class FilmDTO {

    private long id;
    private String title;
    private String genre;
    private long duration;
    private String imageName;

    public FilmDTO(Film film) {
        this.id = film.getId();
        this.title = film.getTitle();
        this.genre = film.getGenre();
        this.duration = film.getDuration();
        this.imageName = film.getImageName();
    }

    public long getId() {
        return id;
    }

    public String getTitle() {
        return title;
    }

    public String getGenre() {
        return genre;
    }

    public long getDuration() {
        return duration;
    }

    public String getImageName() {
        return imageName;
    }
}
