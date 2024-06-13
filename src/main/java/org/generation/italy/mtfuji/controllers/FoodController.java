package org.generation.italy.mtfuji.controllers;

import org.generation.italy.mtfuji.dto.FoodDTO;
import org.generation.italy.mtfuji.model.Beverage;
import org.generation.italy.mtfuji.model.Food;
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
        List<FoodDTO> foodsDto = foodService.getAllFood().stream().map(this::convertToDto).collect(Collectors.toList());
        return ResponseEntity.ok(foodsDto);
    }

    public FoodDTO convertToDto(Food food) {
        FoodDTO dto = new FoodDTO();
        dto.setId(food.getId());
        dto.setName(food.getName());
        dto.setCost(food.getCost());
        dto.setDescription(food.getDescription());
        dto.setGlutenFree(food.isGlutenFree());
        dto.setVegan(food.isVegan());
        dto.setComplimentary(food.isComplimentary());
        dto.setTypeOfFood(food.getType());
        return dto;
    }

    @GetMapping("/{id}")
    public ResponseEntity<FoodDTO> getFoodById(@PathVariable("id") long foodId) {
        Optional<Food> ofood = foodService.getFoodById(foodId);
        if (ofood.isEmpty()) {
            return ResponseEntity.notFound().build();
        }
        Food f = ofood.get();
        FoodDTO dto = new FoodDTO(f);
        return ResponseEntity.ok(dto);
    }
}
