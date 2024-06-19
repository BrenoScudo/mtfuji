package org.generation.italy.mtfuji.model.repositories.abstractions;

import org.generation.italy.mtfuji.model.Karaoke;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface KaraokeRepository extends JpaRepository<Karaoke,Long> {
    List<Karaoke> findByTitleContainingIgnoreCase(String title);

    List<Karaoke> findBySingerContainingIgnoreCase(String title);

    List<Karaoke> findByTitleAndSingerContainingIgnoreCase(String title, String singer);

    List<Karaoke> findAllByOrderByTitle();

    List<Karaoke> findAllByOrderBySinger();
}
