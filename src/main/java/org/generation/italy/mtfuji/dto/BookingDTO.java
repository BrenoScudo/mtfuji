package org.generation.italy.mtfuji.dto;

import org.generation.italy.mtfuji.model.Booking;
import org.generation.italy.mtfuji.model.Room;
import org.generation.italy.mtfuji.model.User;

import java.time.LocalDate;

public class BookingDTO {

    private long id;
    private long userId;
    private long quantity;
    private String check_in;
    private String check_out;
    private String reservation_date;
    private long roomId;
    private boolean paid;
    private float cost;
    private boolean is_promotion;


    public BookingDTO() {
    }

    public BookingDTO(Booking booking) {
        this.id = booking.getId();
        this.userId = booking.getUser().getId();
        this.quantity = booking.getQuantity();
        this.check_in = booking.getCheck_in().toString();
        this.check_out = booking.getCheck_out().toString();
        this.reservation_date = booking.getReservation_date().toString();
        this.paid = booking.isPaid();
        this.roomId = booking.getRoom().getId();
        this.cost = booking.getCost();
        this.is_promotion = booking.isIs_promotion();
    }

    public Booking toBooking() {
        return new Booking(this.id, new User(this.userId), this.quantity,
                LocalDate.parse(this.check_in), LocalDate.parse(this.check_out),
                LocalDate.parse(this.reservation_date), new Room(this.roomId),
                this.paid, this.cost, this.isIs_promotion());
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public long getUserId() {
        return userId;
    }

    public void setUserId(long userId) {
        this.userId = userId;
    }

    public long getQuantity() {
        return quantity;
    }

    public void setQuantity(long quantity) {
        this.quantity = quantity;
    }

    public String getCheck_in() {
        return check_in;
    }

    public void setCheck_in(String check_in) {
        this.check_in = check_in;
    }

    public String getCheck_out() {
        return check_out;
    }

    public void setCheck_out(String check_out) {
        this.check_out = check_out;
    }

    public String getReservation_date() {
        return reservation_date;
    }

    public void setReservation_date(String reservation_date) {
        this.reservation_date = reservation_date;
    }

    public long getRoomId() {
        return roomId;
    }

    public void setRoomId(long roomId) {
        this.roomId = roomId;
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
