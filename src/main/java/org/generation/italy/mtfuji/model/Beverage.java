package org.generation.italy.nomeprogetto.model;

import java.util.ArrayList;
import java.util.List;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity
@Table(name = "beverage")
public class Beverage {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    private String name;
    @Column(columnDefinition = "Numeric")
    private float cost;
    private boolean complimentary;
    private String description;
    private boolean alcoholic;
    @OneToMany(mappedBy = "beverage")
    private List<Orders> orders = new ArrayList<>();

    public Beverage() {
    }

    public Beverage(long id, String name, float cost, boolean complimentary, String description, boolean alcoholic) {
        this.id = id;
        this.name = name;
        this.cost = cost;
        this.complimentary = complimentary;
        this.description = description;
        this.alcoholic = alcoholic;
    }

    public List<Orders> getListOrders() {
        return orders;
    }

    public void setListOrders(List<Orders> listorders) {
        this.orders = listorders;
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

    public boolean isAlcoholic() {
        return alcoholic;
    }

    public void setAlcoholic(boolean alcoholic) {
        this.alcoholic = alcoholic;
    }
    
}
