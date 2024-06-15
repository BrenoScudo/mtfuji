package org.generation.italy.mtfuji.model;

import java.util.ArrayList;
import java.util.List;

public class MenuFood {

    private List<Food> snacks = new ArrayList<>();
    private List<Food> sandwiches = new ArrayList<>();
    private List<Food> salads = new ArrayList<>();
    private List<Food> desserts = new ArrayList<>();
    private List<Food> specialFoods = new ArrayList<>();
    private List<Food> friedFoods = new ArrayList<>();

    public void addFood(Food food){
        switch (food.getType()){
            case SNACKS : snacks.add(food);
                break;
            case SANDWICHES : sandwiches.add(food);
                break;
            case SALADS: salads.add(food);
                break;
            case DESSERTS: desserts.add(food);
                break;
            case FRIED_FOODS: friedFoods.add(food);
                break;
            case SPECIAL_FOODS: specialFoods.add(food);
                break;
        }
    }

    public List<Food> getSnacks() {
        return snacks;
    }

    public List<Food> getSandwiches() {
        return sandwiches;
    }

    public List<Food> getSalads() {
        return salads;
    }

    public List<Food> getDesserts() {
        return desserts;
    }

    public List<Food> getSpecialFoods() {
        return specialFoods;
    }

    public List<Food> getFriedFoods() {
        return friedFoods;
    }
}
