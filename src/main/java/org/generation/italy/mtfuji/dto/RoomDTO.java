package org.generation.italy.mtfuji.dto;

import org.generation.italy.mtfuji.model.Room;

import java.util.ArrayList;
import java.util.List;

public class RoomDTO {
    private long id;
    private String name;
    private Integer max_occupancy;
    private boolean luxury;
//    private List<Booking> reservations = new ArrayList<>();
//    private List<Prices> listPrices = new ArrayList<>();


    public RoomDTO(Room room) {
        this.id = room.getId();
        this.name = room.getName();
        this.max_occupancy = room.getMax_occupancy();
        this.luxury = room.isLuxury();
    }

    public long getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public Integer getMax_occupancy() {
        return max_occupancy;
    }

    public boolean isLuxury() {
        return luxury;
    }
}
