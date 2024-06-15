package org.generation.italy.mtfuji.model;

public class GeneralMenuBeverage {

    private MenuBeverage alcoholicMenu = new MenuBeverage();
    private MenuBeverage alcoholicFreeMenu = new MenuBeverage();

    public void addBeverage(Beverage beverage){
        if (beverage.isAlcoholic()){
            alcoholicMenu.addBeverage(beverage);
        }
        alcoholicFreeMenu.addBeverage(beverage);
    }

    public MenuBeverage getAlcoholicMenu() {
        return alcoholicMenu;
    }

    public MenuBeverage getAlcoholicFreeMenu() {
        return alcoholicFreeMenu;
    }
}
