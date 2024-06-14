package org.generation.italy.mtfuji.model;

import java.util.ArrayList;
import java.util.List;

import jakarta.persistence.*;

@Entity
@Table(name = "food")
public class Food {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private long id;
    @Column(name = "name")
    private String name;
    @Column(name = "cost", columnDefinition = "Numeric")
    private float cost;
    @Column(name = "type")
    @Enumerated(EnumType.STRING)
    private FoodType type;
    @Column(name = "complimentary")
    private boolean complimentary;
    @Column(name = "vegan")
    private boolean vegan;
    @Column(name = "gluten_free")
    private boolean glutenFree;
    @Column(name = "description")
    private String description;
    @OneToMany(mappedBy = "food")
    private List<Orders> orders = new ArrayList<>();
    @Column(name = "image_name")
    private String imageName;

    public Food() {
    }
    
    public Food(long id, String name, float cost, FoodType type, boolean complimentary, boolean vegan,
                boolean glutenFree, String description, String imageName) {
        this.id = id;
        this.name = name;
        this.cost = cost;
        this.type = type;
        this.complimentary = complimentary;
        this.vegan = vegan;
        this.glutenFree = glutenFree;
        this.description = description;
        this.imageName = imageName;
    }

    public Food(String name, float cost, FoodType typeOfFood, boolean complimentary, boolean isVegan, boolean isGlutenFree, String description) {
    }

    public List<Orders> getOrders() {
        return orders;
    }

    public void setOrders(List<Orders> orders) {
        this.orders = orders;
    }

    public long getId() {
        return id;
    }

    public String getImageName() {
        return imageName;
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

    public FoodType getType() {
        return type;
    }

    public void setType(FoodType type) {
        this.type = type;
    }

    public boolean isComplimentary() {
        return complimentary;
    }

    public void setComplimentary(boolean complimentary) {
        this.complimentary = complimentary;
    }

    public boolean isVegan() {
        return vegan;
    }

    public void setVegan(boolean vegan) {
        this.vegan = vegan;
    }

    public boolean isGlutenFree() {
        return glutenFree;
    }

    public void setGlutenFree(boolean glutenFree) {
        this.glutenFree = glutenFree;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
    

}
