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
    private Integer max_occupancy;
    @Column(name = "luxury")
    private boolean luxury;
    @OneToMany(mappedBy = "room")
    private List<Booking> reservations = new ArrayList<>();
    @OneToMany(mappedBy = "room")
    private List<Prices> listPrices = new ArrayList<>();

    public Room() {
    }

    public Room(long id, String name, Integer max_occupancy, boolean luxury) {
        this.id = id;
        this.name = name;
        this.max_occupancy = max_occupancy;
        this.luxury = luxury;
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
    public Integer getMax_occupancy() {
        return max_occupancy;
    }
    public void setMax_occupancy(Integer max_occupancy) {
        this.max_occupancy = max_occupancy;
    }
    public boolean isLuxury() {
        return luxury;
    }
    public void setLuxury(boolean luxury) {
        this.luxury = luxury;
    }
    
}
