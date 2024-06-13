package org.generation.italy.mtfuji.dto;

import org.generation.italy.mtfuji.model.GeneralMenu;
import org.generation.italy.mtfuji.model.Menu;

public class GeneralMenuDTO {

    private MenuDTO standardMenu;
    private MenuDTO celiacMenu;
    private MenuDTO veganMenu;

    public GeneralMenuDTO(GeneralMenu gm) {
        this.standardMenu = new MenuDTO(gm.getStandardMenu());
        this.celiacMenu = new MenuDTO(gm.getCeliacMenu());
        this.veganMenu = new MenuDTO(gm.getVeganMenu());
    }

    public MenuDTO getStandardMenu() {
        return standardMenu;
    }

    public MenuDTO getCeliacMenu() {
        return celiacMenu;
    }

    public MenuDTO getVeganMenu() {
        return veganMenu;
    }
}
