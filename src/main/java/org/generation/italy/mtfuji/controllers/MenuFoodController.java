package org.generation.italy.mtfuji.controllers;

import org.generation.italy.mtfuji.dto.GeneralMenuFoodDTO;
import org.generation.italy.mtfuji.model.GeneralMenuFood;
import org.generation.italy.mtfuji.model.services.abstractions.FoodService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/menu-food")
public class MenuFoodController {

    private  final FoodService foodService;

    @Autowired
    public MenuFoodController(FoodService foodService) {
        this.foodService = foodService;
    }

    @GetMapping
    public ResponseEntity<GeneralMenuFoodDTO> getGeneralMenuFood(){
        GeneralMenuFood gm = foodService.getGeneralMenu();
        GeneralMenuFoodDTO generalMenuDTO = new GeneralMenuFoodDTO(gm);
        return ResponseEntity.ok(generalMenuDTO);
    }
}
