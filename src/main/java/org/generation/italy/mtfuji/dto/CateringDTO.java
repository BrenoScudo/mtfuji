package org.generation.italy.mtfuji.dto;

import org.generation.italy.mtfuji.model.Beverage;
import org.generation.italy.mtfuji.model.Food;

import java.io.Serializable;

public class CateringDTO implements Serializable {

    private long id;
    private String name;
    private float cost;
    private String typeOfFood;
    private boolean complimentary;
    private String description;
    private boolean isVegan;
    private boolean isGlutenFree;
    private boolean isAlcoholic;

    public CateringDTO(Food food){
        this.id = food.getId();
        this.name = food.getName();
        this.cost = food.getCost();
        this.description = food.getDescription();
        this.typeOfFood = food.getType();
        this.isVegan = food.isVegan();
        this.isGlutenFree = food.isGluten_free();
        this.complimentary = food.isComplimentary();
    }

    public CateringDTO(Beverage beverage){
        this.id = beverage.getId();
        this.name = beverage.getName();
        this.description = beverage.getDescription();
        this.cost = beverage.getCost();
        this.isAlcoholic = beverage.isAlcoholic();
        this.complimentary = beverage.isComplimentary();
    }

    public CateringDTO(){

    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public float getCost() {
        return cost;
    }

    public void setCost(float cost) {
        this.cost = cost;
    }

    public String getTypeOfFood() {
        return typeOfFood;
    }

    public void setTypeOfFood(String typeOfFood) {
        this.typeOfFood = typeOfFood;
    }

    public boolean isComplimentary() {
        return complimentary;
    }

    public void setComplimentary(boolean complimentary) {
        this.complimentary = complimentary;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public boolean isVegan() {
        return isVegan;
    }

    public void setVegan(boolean vegan) {
        isVegan = vegan;
    }

    public boolean isGlutenFree() {
        return isGlutenFree;
    }

    public void setGlutenFree(boolean glutenFree) {
        isGlutenFree = glutenFree;
    }

    public boolean isAlcoholic() {
        return isAlcoholic;
    }

    public void setAlcoholic(boolean alcoholic) {
        isAlcoholic = alcoholic;
    }
}
