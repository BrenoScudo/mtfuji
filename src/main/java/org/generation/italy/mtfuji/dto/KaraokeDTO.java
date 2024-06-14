package org.generation.italy.mtfuji.dto;

import org.generation.italy.mtfuji.model.Karaoke;

public class KaraokeDTO {

    private long id;
    private String title;
    private String genre;
    private String singer;

    public KaraokeDTO(Karaoke karaoke) {
        this.id = karaoke.getId();
        this.title = karaoke.getTitle();
        this.genre = karaoke.getGenre();
        this.singer = karaoke.getSinger();
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

    public String getSinger() {
        return singer;
    }
}
