package org.generation.italy.mtfuji.model.services.abstractions;

import org.generation.italy.mtfuji.model.Beverage;
import org.generation.italy.mtfuji.model.Karaoke;

import java.util.List;
import java.util.Optional;

public interface KaraokeService {
    List<Karaoke> getAllKaraoke();

    Optional<Karaoke> getKaraokeById(long id);

    List<Karaoke> findByTitleLike(String titleLike);

    List<Karaoke> findBySingerLike(String AuthorLike);

    List<Karaoke> findByTitleAndSingerLike(String title, String singer);
}
