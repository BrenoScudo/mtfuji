package org.generation.italy.mtfuji.dto;

import org.generation.italy.mtfuji.model.Room;

public class RoomDTO {
    private long id;
    private String name;
    private Integer maxOccupancy;
    private boolean luxury;
    private String imageName;
//    private List<Booking> reservations = new ArrayList<>();
//    private List<Prices> listPrices = new ArrayList<>();


    public RoomDTO(Room room, String imageName) {
        this.id = room.getId();
        this.name = room.getName();
        this.maxOccupancy = room.getMaxOccupancy();
        this.luxury = room.isLuxury();
        this.imageName = imageName;
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
}
