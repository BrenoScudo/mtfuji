package org.generation.italy.mtfuji.controllers;

import org.generation.italy.mtfuji.dto.KaraokeDTO;
import org.generation.italy.mtfuji.model.Karaoke;
import org.generation.italy.mtfuji.model.services.abstractions.KaraokeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.*;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/karaoke")
public class KaraokeController {

    private final KaraokeService karaokeService;

    @Autowired
    public KaraokeController(KaraokeService karaokeService) {
        this.karaokeService = karaokeService;
    }

    @GetMapping
    public List<KaraokeDTO> getAllKaraoke() {
        //            karaokeDTO.setId(karaoke.getId());
        //            karaokeDTO.setTitle(karaoke.getTitle());
        //            karaokeDTO.setGenre(karaoke.getGenre());
        //            karaokeDTO.setSinger(karaoke.getSinger());
        //             karaokeDTO;
        return karaokeService.getAllKaraoke().stream().map(KaraokeDTO::new).collect(Collectors.toList());
    }

    @GetMapping("/{search}")
    public ResponseEntity<List<KaraokeDTO>> getKaraokeByTitleOrSinger(
            @PathVariable String search) {

        List<Karaoke> songsByTitle;
        List<Karaoke> songsBySinger;

        if (!search.isEmpty()) {
            songsByTitle = karaokeService.findByTitleLike(search);
            songsBySinger = karaokeService.findBySingerLike(search);
        } else {
            return ResponseEntity.badRequest().build();
        }

        // Combina le due liste senza duplicati
        Set<Karaoke> combinedSongs = new HashSet<>();
        combinedSongs.addAll(songsByTitle);
        combinedSongs.addAll(songsBySinger);

        if (combinedSongs.isEmpty()) {
            return ResponseEntity.notFound().build();
        }

        return ResponseEntity.ok().body(combinedSongs.stream().map(KaraokeDTO::new).toList());
    }


//
//    @GetMapping("/byTitle")
//    public ResponseEntity<List<KaraokeDTO>> getKaraokeByTitle(@RequestParam(defaultValue = "") String title) {
//        List<Karaoke> songs = karaokeService.findByTitleLike(title);
//        if(songs.isEmpty()){
//            return ResponseEntity.notFound().build();
//        }
////        List<KaraokeDTO> dto = songs.stream().map(KaraokeDTO::new).collect(Collectors.toList());
//          return ResponseEntity.ok().body(songs.stream().map(KaraokeDTO::new).toList());
////        return ResponseEntity.ok(dto);
//    }
//
//    @GetMapping("/bySinger")
//    public ResponseEntity<List<KaraokeDTO>> getKaraokeBySinger(@RequestParam(defaultValue = "") String singer) {
//        List<Karaoke> songs = karaokeService.findBySingerLike(singer);
//        if(songs.isEmpty()){
//            return ResponseEntity.notFound().build();
//        }
//        return ResponseEntity.ok().body(songs.stream().map(KaraokeDTO::new).toList());
//    }
}
