package org.generation.italy.mtfuji.controllers;

import java.util.List;


import org.generation.italy.mtfuji.model.Beverage;
import org.generation.italy.mtfuji.model.services.abstractions.BeverageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.scheduling.config.Task;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/beverages")
public class BeverageController {
	private final BeverageService beverageService;

	@Autowired
	public BeverageController(BeverageService beverageService) {
		this.beverageService = beverageService;
	}

	//get all beverage
    @GetMapping
    public List<Beverage> getAllBeverages(){
        return beverageService.getAllBeverage();
    }

}
