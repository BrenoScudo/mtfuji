package org.generation.italy.mtfuji.controllers;

import org.generation.italy.mtfuji.dto.GeneralMenuBeverageDTO;
import org.generation.italy.mtfuji.model.GeneralMenuBeverage;
import org.generation.italy.mtfuji.model.services.abstractions.BeverageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/beverage")
public class MenuBeverageController {

    private  final BeverageService beverageService;

    @Autowired
    public MenuBeverageController(BeverageService beverageService) {
        this.beverageService = beverageService;
    }

    @GetMapping("/beverage")
    public ResponseEntity<GeneralMenuBeverageDTO> getGeneralMenuBeverage(){
        GeneralMenuBeverage gm = beverageService.getGeneralMenu();
        GeneralMenuBeverageDTO generalMenuDTO = new GeneralMenuBeverageDTO(gm);
        return ResponseEntity.ok(generalMenuDTO);
    }
}
