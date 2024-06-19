package org.generation.italy.mtfuji.model.services.implementations;

import org.generation.italy.mtfuji.model.Karaoke;
import org.generation.italy.mtfuji.model.repositories.abstractions.KaraokeRepository;
import org.generation.italy.mtfuji.model.services.abstractions.KaraokeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class JpaKaraokeService implements KaraokeService {

    private final KaraokeRepository karaokeRepository;

    @Autowired
    public JpaKaraokeService(KaraokeRepository karaokeRepository) {
        this.karaokeRepository = karaokeRepository;
    }

    @Override
    public List<Karaoke> getAllKaraoke() {
        return karaokeRepository.findAllByOrderBySinger();
    }

    @Override
    public Optional<Karaoke> getKaraokeById(long id) {
        return karaokeRepository.findById(id);
    }

    @Override
    public List<Karaoke> findByTitleLike(String titleLike) {
        return karaokeRepository.findByTitleContainingIgnoreCase(titleLike);
    }

    @Override
    public List<Karaoke> findBySingerLike(String singerLike) {
        return karaokeRepository.findBySingerContainingIgnoreCase(singerLike);
    }

    @Override
    public List<Karaoke> findByTitleAndSingerLike(String title, String singer) {
        return karaokeRepository.findByTitleAndSingerContainingIgnoreCase(title, singer);
    }
}
