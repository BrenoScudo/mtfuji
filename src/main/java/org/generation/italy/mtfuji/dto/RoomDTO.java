package org.generation.italy.mtfuji.dto;

import org.generation.italy.mtfuji.model.Room;

import java.math.BigDecimal;

public class RoomDTO {
    private long id;
    private String name;
    private Integer maxOccupancy;
    private boolean luxury;
    private String imageName;
    private BigDecimal cost;
//    private List<Booking> reservations = new ArrayList<>();
//    private List<Prices> listPrices = new ArrayList<>();


    public RoomDTO(Room room) {
        this.id = room.getId();
        this.name = room.getName();
        this.maxOccupancy = room.getMax_occupancy();
        this.luxury = room.isLuxury();
        this.cost = room.getCost();
        this.imageName = room.getImageName();
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

    public String getImageName() {
        return imageName;
    }

    public void setImageName(String imageName) {
        this.imageName = imageName;
    }

    public BigDecimal getCost() {
        return cost;
    }
}
