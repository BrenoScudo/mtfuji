package org.generation.italy.mtfuji.dto;

import org.generation.italy.mtfuji.model.Film;
import org.generation.italy.mtfuji.model.Karaoke;

public class MultimediaDTO {

    private long id;
    private  String title;
    private String genre;
    private long durationFilm;
    private String singer;

    public MultimediaDTO(Karaoke karaoke) {
        this.id = karaoke.getId();
        this.title = karaoke.getTitle();
        this.genre = karaoke.getGenre();
        this.singer = karaoke.getSinger();
    }

    public MultimediaDTO(Film film) {
        this.id = film.getId();
        this.title = film.getTitle();
        this.genre = film.getGenre();
        this.durationFilm = film.getDuration();
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

    public long getDurationFilm() {
        return durationFilm;
    }

    public String getSinger() {
        return singer;
    }
}
