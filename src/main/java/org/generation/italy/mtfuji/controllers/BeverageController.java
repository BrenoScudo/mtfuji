package org.generation.italy.nomeprogetto.controllers;

import java.util.List;

import org.generation.italy.nomeprogetto.model.Beverage;
import org.generation.italy.nomeprogetto.model.repositories.abstractions.BeverageRepository;
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
    private BeverageRepository beverageRepository;

    //get all beverage
    @GetMapping("/all/beverages")
    public List<Beverage> getAllBeverages(){
        return beverageRepository.findAll();
    }

    //Put new beverage    
	@PutMapping("/{id}")
	public ResponseEntity<Task> updateBeverage(@PathVariable("id") long id, @RequestBody Beverage beverage) {
		beverage.setId(id);
		Task updatedBeverage = taskService.updateTask(beverage);
		return ResponseEntity.ok(updatedBeverage);
	}

	@DeleteMapping("/{id}")
	public ResponseEntity<Void> deleteBeverageById(@PathVariable("id") long id) {
		taskService.deleteBeverageById(id);
		return ResponseEntity.noContent().build();
	}

}
