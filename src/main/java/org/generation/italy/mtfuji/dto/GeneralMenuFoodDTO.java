package org.generation.italy.mtfuji.dto;

import org.generation.italy.mtfuji.model.GeneralMenuFood;

public class GeneralMenuFoodDTO {

    private MenuFoodDTO standardMenu;
    private MenuFoodDTO celiacMenu;
    private MenuFoodDTO veganMenu;

    public GeneralMenuFoodDTO(GeneralMenuFood gm) {
        this.standardMenu = new MenuFoodDTO(gm.getStandardMenu());
        this.celiacMenu = new MenuFoodDTO(gm.getCeliacMenu());
        this.veganMenu = new MenuFoodDTO(gm.getVeganMenu());
    }

    public MenuFoodDTO getStandardMenu() {
        return standardMenu;
    }

    public MenuFoodDTO getCeliacMenu() {
        return celiacMenu;
    }

    public MenuFoodDTO getVeganMenu() {
        return veganMenu;
    }
}
