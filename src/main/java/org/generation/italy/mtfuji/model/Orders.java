package org.generation.italy.mtfuji.model;

import jakarta.persistence.*;

@Entity
@Table(name = "orders")
public class Orders {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private long id;
    @ManyToOne
    @JoinColumn(name = "id_booking")
    private Booking booking;
    @ManyToOne
    @JoinColumn(name = "id_food")
    private Food food;
    @ManyToOne
    @JoinColumn(name = "id_beverage")
    private Beverage beverage;
    @Column(name = "quantity")
    private long quantity;
   
    public Orders() {
    }

    public Orders(long id, Booking booking, Food food, Beverage beverage, long quantity) {
        this.id = id;
        this.booking = booking;
        this.food = food;
        this.beverage = beverage;
        this.quantity = quantity;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public Booking getBooking() {
        return booking;
    }

    public void setBooking(Booking booking) {
        this.booking = booking;
    }

    public Food getFood() {
        return food;
    }

    public void setFood(Food food) {
        this.food = food;
    }

    public Beverage getBeverage() {
        return beverage;
    }

    public void setBeverage(Beverage beverage) {
        this.beverage = beverage;
    }

    public long getQuantity() {
        return quantity;
    }

    public void setQuantity(long quantity) {
        this.quantity = quantity;
    }
    
}
