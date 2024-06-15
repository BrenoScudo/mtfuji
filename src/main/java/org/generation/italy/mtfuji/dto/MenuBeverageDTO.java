package org.generation.italy.mtfuji.dto;


import org.generation.italy.mtfuji.model.MenuBeverage;

import java.util.ArrayList;
import java.util.List;

public class MenuBeverageDTO {

    private List<BeverageDTO> alcoholicDrinks = new ArrayList<>();
    private List<BeverageDTO> alcoholicFree = new ArrayList<>();

    public MenuBeverageDTO(MenuBeverage m) {

        m.getAlcoholicDrinks().stream().map(BeverageDTO::new).forEach(alcoholicDrinks::add);
        m.getAlcoholicFree().stream().map(BeverageDTO::new).forEach(alcoholicFree::add);
    }

    public List<BeverageDTO> getAlcoholicDrinks() {
        return alcoholicDrinks;
    }

    public List<BeverageDTO> getAlcoholicFree() {
        return alcoholicFree;
    }
}
