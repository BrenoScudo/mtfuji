package org.generation.italy.mtfuji.controllers;

import org.generation.italy.mtfuji.model.Beverage;
import org.generation.italy.mtfuji.model.Food;
import org.generation.italy.mtfuji.model.services.abstractions.BeverageService;
import org.generation.italy.mtfuji.model.services.abstractions.FoodService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/catering")
public class CateringDTOController {

    private  BeverageService beverageService;
    private  FoodService foodService;

    @Autowired
    public CateringDTOController(BeverageService beverageService) {
        this.beverageService = beverageService;
    }

    @Autowired
    public CateringDTOController(FoodService foodService) {
        this.foodService = foodService;
    }

    @GetMapping
    public List<Beverage> getAllBeverages(){
        return beverageService.getAllBeverage();
    }

    @GetMapping
    public List<Food> getAllFood(){
        return foodService.getAllFood();
    }


   /* @GetMapping("/{id}")
    public ResponseEntity<ItemDTO> getItemById(@PathVariable Long id, @RequestParam String itemType) {
        if ("Food".equalsIgnoreCase(itemType)) {
            // Implementa la logica per ottenere un Food
        } else if ("Beverage".equalsIgnoreCase(itemType)) {
            // Implementa la logica per ottenere una Beverage
        } else {
            return ResponseEntity.badRequest().build();
        }
    }*/
}
