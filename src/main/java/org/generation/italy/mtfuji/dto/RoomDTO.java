package org.generation.italy.mtfuji.dto;

import org.generation.italy.mtfuji.model.Room;

import java.math.BigDecimal;

public class RoomDTO {
    private long id;
    private String name;
    private Integer maxOccupancy;
    private boolean luxury;
    private BigDecimal cost;
//    private List<Booking> reservations = new ArrayList<>();
//    private List<Prices> listPrices = new ArrayList<>();


    public RoomDTO(Room room) {
        this.id = room.getId();
        this.name = room.getName();
        this.maxOccupancy = room.getMax_occupancy();
        this.luxury = room.isLuxury();
        this.cost = room.getCost();
    }

    public long getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public Integer getMaxOccupancy() {
        return maxOccupancy;
    }

    public boolean isLuxury() {
        return luxury;
    }

    public BigDecimal getCost() {
        return cost;
    }
}
