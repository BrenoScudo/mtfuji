package org.generation.italy.nomeprogetto.model;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity
@Table(name = "booking")
public class Booking {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    @ManyToOne
    @JoinColumn(name = "id_user")
    private User user;
    private long quantity;
    @Column(columnDefinition = "timestamp")
    private LocalDate check_in;
    @Column(columnDefinition = "timestamp")
    private LocalDate check_out;
    @Column(columnDefinition = "timestamp")
    private LocalDate reservation_date;
    @ManyToOne
    @JoinColumn(name = "id_room")
    private Room room;
    private boolean paid;
    @Column(columnDefinition = "Numeric")
    private float cost;
    private boolean is_promotion;
    @OneToMany(mappedBy = "booking")
    private List<Orders> orders = new ArrayList<>();

    public Booking() {
    }

    public Booking(long id, User user, long quantity, LocalDate check_in, LocalDate check_out, LocalDate reservation,
            Room room, boolean paid, float cost, boolean is_promotion) {
        this.id = id;
        this.user = user;
        this.quantity = quantity;
        this.check_in = check_in;
        this.check_out = check_out;
        this.reservation_date = reservation;
        this.room = room;
        this.paid = paid;
        this.cost = cost;
        this.is_promotion = is_promotion;
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

    public void setId(long id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public long getQuantity() {
        return quantity;
    }

    public void setQuantity(long quantity) {
        this.quantity = quantity;
    }

    public LocalDate getCheck_in() {
        return check_in;
    }

    public void setCheck_in(LocalDate check_in) {
        this.check_in = check_in;
    }

    public LocalDate getCheck_out() {
        return check_out;
    }

    public void setCheck_out(LocalDate check_out) {
        this.check_out = check_out;
    }

    public LocalDate getReservation_date() {
        return reservation_date;
    }

    public void setReservation_date(LocalDate reservation) {
        this.reservation_date = reservation;
    }

    public Room getRoom() {
        return room;
    }

    public void setRoom(Room room) {
        this.room = room;
    }

    public boolean isPaid() {
        return paid;
    }

    public void setPaid(boolean paid) {
        this.paid = paid;
    }

    public float getCost() {
        return cost;
    }

    public void setCost(float cost) {
        this.cost = cost;
    }

    public boolean isIs_promotion() {
        return is_promotion;
    }

    public void setIs_promotion(boolean is_promotion) {
        this.is_promotion = is_promotion;
    }
    

}
