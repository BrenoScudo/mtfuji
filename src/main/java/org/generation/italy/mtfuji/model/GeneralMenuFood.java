package org.generation.italy.mtfuji.model;

public class GeneralMenuFood {

    private MenuFood standardMenu = new MenuFood();
    private MenuFood celiacMenu = new MenuFood();
    private MenuFood veganMenu = new MenuFood();

    public void addFood(Food food){
        standardMenu.addFood(food);
        if (food.isGlutenFree()){
            celiacMenu.addFood(food);
        }
        if (food.isVegan()) {
            veganMenu.addFood(food);
        }
    }

    public MenuFood getStandardMenu() {
        return standardMenu;
    }

    public MenuFood getCeliacMenu() {
        return celiacMenu;
    }

    public MenuFood getVeganMenu() {
        return veganMenu;
    }
}
