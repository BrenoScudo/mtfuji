package org.generation.italy.mtfuji.dto;

import org.generation.italy.mtfuji.model.Food;

public class FoodDTO {

    private long id;
    private String name;
    private float cost;
    private String typeOfFood;
    private boolean complimentary;
    private String description;
    private boolean isVegan;
    private boolean isGlutenFree;

    public FoodDTO() {
    }

    public FoodDTO(Food food) {
        this.id = food.getId();
        this.name = food.getName();
        this.cost = food.getCost();
        this.typeOfFood = food.getType();
        this.complimentary = food.isComplimentary();
        this.description = food.getDescription();
        this.isVegan = food.isVegan();
        this.isGlutenFree = food.isGlutenFree();
    }

    public long getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public float getCost() {
        return cost;
    }

    public String getTypeOfFood() {
        return typeOfFood;
    }

    public boolean isComplimentary() {
        return complimentary;
    }

    public String getDescription() {
        return description;
    }

    public boolean isVegan() {
        return isVegan;
    }

    public boolean isGlutenFree() {
        return isGlutenFree;
    }

    public Food toFood(){
        return new Food(this.name,this.cost, this.typeOfFood, this.complimentary, this.isVegan, this.isGlutenFree,this.description);
    }

    public void setId(long id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setCost(float cost) {
        this.cost = cost;
    }

    public void setTypeOfFood(String typeOfFood) {
        this.typeOfFood = typeOfFood;
    }

    public void setComplimentary(boolean complimentary) {
        this.complimentary = complimentary;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setVegan(boolean vegan) {
        isVegan = vegan;
    }

    public void setGlutenFree(boolean glutenFree) {
        isGlutenFree = glutenFree;
    }
}
