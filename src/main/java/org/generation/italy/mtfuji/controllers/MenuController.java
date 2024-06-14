package org.generation.italy.mtfuji.controllers;

import org.generation.italy.mtfuji.dto.GeneralMenuDTO;
import org.generation.italy.mtfuji.model.GeneralMenu;
import org.generation.italy.mtfuji.model.services.abstractions.FoodService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/menu")
public class MenuController {

    private final FoodService foodService;

    @Autowired
    public MenuController(FoodService foodService) {
        this.foodService = foodService;
    }

    @GetMapping
    public ResponseEntity<GeneralMenuDTO> getGeneralMenu(){
        GeneralMenu gm = foodService.getGeneralMenu();
        GeneralMenuDTO generalMenuDTO = new GeneralMenuDTO(gm);
        return ResponseEntity.ok(generalMenuDTO);
    }
}
