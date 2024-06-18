package org.generation.italy.mtfuji.dto;

import org.generation.italy.mtfuji.model.Booking;
import org.generation.italy.mtfuji.model.Orders;
import org.generation.italy.mtfuji.model.Room;
import org.generation.italy.mtfuji.model.User;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class BookingDTO {

    private long id;
    private User user;
    private long quantity;
    private LocalDate check_in;
    private LocalDate check_out;
    private LocalDate reservation_date;
    private Room room;
    private boolean paid;
    private float cost;
    private boolean is_promotion;


    public BookingDTO() {
    }

    public BookingDTO(Booking booking) {
        this.id = booking.getId();
        this.user = booking.getUser();
        this.quantity = booking.getQuantity();
        this.check_in = booking.getCheck_in();
        this.check_out = booking.getCheck_out();
        this.reservation_date = booking.getReservation_date();
        this.paid = booking.isPaid();
        this.room = booking.getRoom();
        this.cost = booking.getCost();
        this.is_promotion = booking.isIs_promotion();
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

    public void setReservation_date(LocalDate reservation_date) {
        this.reservation_date = reservation_date;
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
