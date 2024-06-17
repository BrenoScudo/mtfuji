package org.generation.italy.mtfuji.model;

import java.util.ArrayList;
import java.util.List;

public class MenuBeverage {

    private List<Beverage> alcoholicDrinks = new ArrayList<>();
    private List<Beverage> alcoholicFree = new ArrayList<>();

    public void addBeverage(Beverage beverage) {
        if (beverage.isAlcoholic()){
            alcoholicDrinks.add(beverage);
        }else{
            alcoholicFree.add(beverage);
        }
    }

    public List<Beverage> getAlcoholicDrinks() {
        return alcoholicDrinks;
    }

    public List<Beverage> getAlcoholicFree() {
        return alcoholicFree;
    }
}
