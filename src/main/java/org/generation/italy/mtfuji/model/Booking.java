package org.generation.italy.mtfuji.model;

import java.time.LocalDate;
import java.time.LocalDateTime;
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
    @Column(name = "id")
    private long id;
    @ManyToOne
    @JoinColumn(name = "id_user")
    private User user;
    @Column(name = "quantity")
    private long quantity;
    @Column(name = "check_in", columnDefinition = "timestamp")
    private LocalDateTime checkIn;
    @Column(name = "check_out", columnDefinition = "timestamp")
    private LocalDateTime checkOut;
    @Column(name = "reservation_date", columnDefinition = "timestamp")
    private LocalDate reservationDate;
    @ManyToOne
    @JoinColumn(name = "id_room")
    private Room room;
    @Column(name = "paid")
    private boolean paid;
    @Column(name = "cost", columnDefinition = "Numeric")
    private float cost;
    @Column(name = "is_promotion")
    private boolean isPromotion;
    @OneToMany(mappedBy = "booking")
    private List<Orders> orders = new ArrayList<>();

    public Booking() {
    }

    public Booking(long id, User user, long quantity, LocalDateTime checkIn, LocalDateTime checkOut, LocalDate reservation,
                   Room room, boolean paid, float cost, boolean isPromotion) {
        this.id = id;
        this.user = user;
        this.quantity = quantity;
        this.checkIn = checkIn;
        this.checkOut = checkOut;
        this.reservationDate = reservation;
        this.room = room;
        this.paid = paid;
        this.cost = cost;
        this.isPromotion = isPromotion;
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

    public LocalDateTime getCheckIn() {
        return checkIn;
    }

    public void setCheckIn(LocalDateTime check_in) {
        this.checkIn = check_in;
    }

    public LocalDateTime getCheckOut() {
        return checkOut;
    }

    public void setCheckOut(LocalDateTime check_out) {
        this.checkOut = check_out;
    }

    public LocalDate getReservationDate() {
        return reservationDate;
    }

    public void setReservationDate(LocalDate reservation) {
        this.reservationDate = reservation;
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

    public boolean isIsPromotion() {
        return isPromotion;
    }

    public void setIsPromotion(boolean is_promotion) {
        this.isPromotion = is_promotion;
    }
    

}
