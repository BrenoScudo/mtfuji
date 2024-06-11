package org.generation.italy.nomeprogetto.model;

import java.util.ArrayList;
import java.util.List;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity
@Table(name = "room")
public class Room {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    private String name;
    private Integer max_occupancy;
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
