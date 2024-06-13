package org.generation.italy.mtfuji.model.services.implementations;

import org.generation.italy.mtfuji.model.Room;
import org.generation.italy.mtfuji.model.services.abstractions.RoomService;

import java.util.List;

public class JpaRoomService implements RoomService {


    @Override
    public List<Room> getAllRooms() {
        return List.of();
    }
}
