package org.generation.italy.mtfuji.model;

import jakarta.persistence.*;

@Entity
@Table(name = "film")
public class Film {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private long id;
    @Column(name = "title")
    private String title;
    @Column(name = "genre")
    private String genre;
    @Column(name = "duration")
    private long duration;
    @Column(name = "image_name")
    private String imageName;

    public Film() {
    }

    public Film(long id, String title, String genre, long duration, String imageName) {
        this.id = id;
        this.title = title;
        this.genre = genre;
        this.duration = duration;
        this.imageName = imageName;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getGenre() {
        return genre;
    }

    public void setGenre(String genre) {
        this.genre = genre;
    }

    public long getDuration() {
        return duration;
    }

    public void setDuration(long duration) {
        this.duration = duration;
    }

    public String getImageName() {
        return imageName;
    }
}
