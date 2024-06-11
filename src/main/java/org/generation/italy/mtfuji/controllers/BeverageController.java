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
@RequestMapping("/beverage")
public class BeverageController {

    @Autowired
    private BeverageService beverageService;

    //get all beverage
    @GetMapping("/all/beverages")
    public List<Beverage> getAllBeverages(){
        return beverageService.getAllBeverage();
    }

    //Put new beverage    
	@PutMapping("/{id}")
	public ResponseEntity<Beverage> updateBeverage(@PathVariable("id") long id, @RequestBody Beverage beverage) {
		Beverage updatedBeverage = beverageService.updateBeverage(beverage);
		return ResponseEntity.ok(updatedBeverage);
	}

	@DeleteMapping("/{id}")
	public ResponseEntity<Void> deleteBeverageById(@PathVariable("id") long id) {
		beverageService.deleteBeverageById(id);
		return ResponseEntity.noContent().build();
	}

}
