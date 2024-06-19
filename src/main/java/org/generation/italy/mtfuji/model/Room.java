package org.generation.italy.mtfuji.model;

import java.util.ArrayList;
import java.util.List;

import jakarta.persistence.*;

@Entity
@Table(name = "room")
public class Room {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private long id;
    @Column(name = "name")
    private String name;
    @Column(name = "max_occupancy")
    private Integer maxOccupancy;
    @Column(name = "luxury")
    private boolean luxury;
    @Column(name = "image_name")
    private String imageName;
    @OneToMany(mappedBy = "room")
    private List<Booking> reservations = new ArrayList<>();
    @OneToMany(mappedBy = "room")
    private List<Prices> listPrices = new ArrayList<>();

    public Room() {
    }

    public Room(long id, String name, Integer maxOccupancy, boolean luxury, String imageName) {
        this.id = id;
        this.name = name;
        this.maxOccupancy = maxOccupancy;
        this.luxury = luxury;
        this.imageName = imageName;
    }

    public Room(long id) {
        this.id = id;
    }

    public List<Prices> getListPrices() {
        return listPrices;
    }

    public void setListPrices(List<Prices> listPrices) {
        this.listPrices = listPrices;
    }

    public List<Booking> getReservations() {
        return reservations;
    }

    public void setReservations(List<Booking> reservations) {
        this.reservations = reservations;
    }

    public long getId() {
        return id;
    }
    public void setId(long id) {
        this.id = id;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public Integer getMaxOccupancy() {
        return maxOccupancy;
    }
    public void setMaxOccupancy(Integer maxOccupancy) {
        this.maxOccupancy = maxOccupancy;
    }
    public boolean isLuxury() {
        return luxury;
    }
    public void setLuxury(boolean luxury) {
        this.luxury = luxury;
    }
    public String getImageName() {
        return imageName;
    }
    public void setImageName(String imageName) {
        this.imageName = imageName;
    }
}
