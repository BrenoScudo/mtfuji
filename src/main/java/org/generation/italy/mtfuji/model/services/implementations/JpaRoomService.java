package org.generation.italy.mtfuji.model.services.implementations;

import org.generation.italy.mtfuji.model.Room;
import org.generation.italy.mtfuji.model.repositories.abstractions.RoomRepository;
import org.generation.italy.mtfuji.model.services.abstractions.RoomService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class JpaRoomService implements RoomService {

    private final RoomRepository roomRepository;

    @Autowired
    public JpaRoomService(RoomRepository roomRepository) {
        this.roomRepository = roomRepository;
    }

    @Override
    public List<Room> getAllRooms() {
        return roomRepository.findAll();
    }

}
