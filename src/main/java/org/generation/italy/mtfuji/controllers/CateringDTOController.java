package org.generation.italy.mtfuji.controllers;

import org.generation.italy.mtfuji.model.services.abstractions.BeverageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/catering")
public class CateringDTOController {


    @Autowired


    @GetMapping("/{id}")
    public ResponseEntity<ItemDTO> getItemById(@PathVariable Long id, @RequestParam String itemType) {
        if ("Food".equalsIgnoreCase(itemType)) {
            // Implementa la logica per ottenere un Food
        } else if ("Beverage".equalsIgnoreCase(itemType)) {
            // Implementa la logica per ottenere una Beverage
        } else {
            return ResponseEntity.badRequest().build();
        }
    }
}
