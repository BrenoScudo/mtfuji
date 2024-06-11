package org.generation.italy.mtfuji.model;

import jakarta.persistence.*;

@Entity
@Table(name = "karaoke")
public class Karaoke {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private long id;
    @Column(name = "title")
    private String title;
    @Column(name = "genre")
    private String genre;
    @Column(name = "singer")
    private String singer;

    public Karaoke() {
    }

    public Karaoke(long id, String title, String genre, String singer) {
        this.id = id;
        this.title = title;
        this.genre = genre;
        this.singer = singer;
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
    public String getSinger() {
        return singer;
    }
    public void setSinger(String singer) {
        this.singer = singer;
    }

    
}
