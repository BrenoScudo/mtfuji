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
        return karaokeRepository.findAll();
    }

    @Override
    public Optional<Karaoke> getKaraokeById(long id) {
        return karaokeRepository.findById(id);
    }

    @Override
    public List<Karaoke> findByNameLike(String name) {
        return List.of();
    }

    @Override
    public List<Karaoke> findByTitleLike(String titleLike) {
        return karaokeRepository.findByTitleContainingIgnoreCase(titleLike);
    }
}
