package org.generation.italy.mtfuji.dto;

import org.generation.italy.mtfuji.model.Beverage;
import org.generation.italy.mtfuji.model.Food;

import java.io.Serializable;

public class BeverageDTO implements Serializable {

    private long id;
    private String name;
    private float cost;
    private boolean complimentary;
    private String description;
    private boolean isAlcoholic;

    public BeverageDTO(Beverage beverage){
        this.id = beverage.getId();
        this.name = beverage.getName();
        this.description = beverage.getDescription();
        this.cost = beverage.getCost();
        this.isAlcoholic = beverage.isAlcoholic();
        this.complimentary = beverage.isComplimentary();
    }

    public BeverageDTO(){

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

    public boolean isComplimentary() {
        return complimentary;
    }

    public String getDescription() {
        return description;
    }

    public boolean isAlcoholic() {
        return isAlcoholic;
    }

    public Beverage toBeverage(){
        return new Beverage(this.name, this.description, this.complimentary, this.isAlcoholic, this.cost);
    }
}
