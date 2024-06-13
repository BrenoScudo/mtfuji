package org.generation.italy.mtfuji.model;

public class GeneralMenu {

    private  Menu standardMenu = new Menu();
    private  Menu celiacMenu = new Menu();
    private  Menu veganMenu = new Menu();

    public void addFood(Food food){
        standardMenu.addFood(food);
        if (food.isGlutenFree()){
            celiacMenu.addFood(food);
        } else if (food.isVegan()) {
            veganMenu.addFood(food);
        }
    }

    public Menu getStandardMenu() {
        return standardMenu;
    }

    public Menu getCeliacMenu() {
        return celiacMenu;
    }

    public Menu getVeganMenu() {
        return veganMenu;
    }
}
