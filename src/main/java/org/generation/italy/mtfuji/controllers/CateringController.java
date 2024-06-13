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
public class CateringController {

    private  BeverageService beverageService;
    private  FoodService foodService;


    @Autowired
    public CateringController(BeverageService beverageService, FoodService foodService) {
        this.beverageService = beverageService;
        this.foodService = foodService;
    }

    @GetMapping("/beverages")
    public List<Beverage> getAllBeverages(){
        return beverageService.getAllBeverage();
    }

    @GetMapping("/foods")
    public List<Food> getAllFood(){
        return foodService.getAllFood();
    }
}
