package org.generation.italy.mtfuji.model.repositories.abstractions;

import org.generation.italy.mtfuji.model.Room;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface RoomRepository extends JpaRepository<Room, Long> {

}
