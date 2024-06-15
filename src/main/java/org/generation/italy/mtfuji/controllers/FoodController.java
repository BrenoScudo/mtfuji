package org.generation.italy.mtfuji.controllers;

import org.generation.italy.mtfuji.dto.FoodDTO;
import org.generation.italy.mtfuji.dto.GeneralMenuDTO;
import org.generation.italy.mtfuji.model.Beverage;
import org.generation.italy.mtfuji.model.Food;
import org.generation.italy.mtfuji.model.GeneralMenu;
import org.generation.italy.mtfuji.model.services.abstractions.FoodService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/foods")
public class FoodController {
    private final FoodService foodService;

    @Autowired
    public FoodController(FoodService foodService) {
        this.foodService = foodService;
    }

    //get all beverage
    @GetMapping
    public ResponseEntity<List<FoodDTO>> getAllFoods(){
        List<FoodDTO> foodsDto = foodService.getAllFood().stream().map(FoodDTO::new).collect(Collectors.toList());
        return ResponseEntity.ok(foodsDto);
    }

    @GetMapping("/{id}")
    public ResponseEntity<FoodDTO> getFoodById(@PathVariable("id") long foodId) {
        Optional<Food> oFood = foodService.getFoodById(foodId);

        return oFood.map(food -> {
            FoodDTO dto = new FoodDTO(food);
            return ResponseEntity.ok(dto);
        }).orElseGet(() -> ResponseEntity.notFound().build());

//        if (oFood.isEmpty()) {
//            return ResponseEntity.notFound().build();
//        }
//        Food f = oFood.get();
//        FoodDTO dto = new FoodDTO(f);
//        return ResponseEntity.ok(dto);
    }


}
