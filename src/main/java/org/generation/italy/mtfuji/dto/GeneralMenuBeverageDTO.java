package org.generation.italy.mtfuji.dto;

import org.generation.italy.mtfuji.model.GeneralMenuBeverage;

public class GeneralMenuBeverageDTO {

    private MenuBeverageDTO alcoholicMenu;
    private MenuBeverageDTO alcoholicFreeMenu;

    public GeneralMenuBeverageDTO(GeneralMenuBeverage gm) {

        this.alcoholicMenu = new MenuBeverageDTO(gm.getAlcoholicMenu());
        this.alcoholicFreeMenu = new MenuBeverageDTO(gm.getAlcoholicFreeMenu());
    }

    public MenuBeverageDTO getAlcoholicMenu() {
        return alcoholicMenu;
    }

    public MenuBeverageDTO getAlcoholicFreeMenu() {
        return alcoholicFreeMenu;
    }
}
