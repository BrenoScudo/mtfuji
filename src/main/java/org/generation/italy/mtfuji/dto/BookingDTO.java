package org.generation.italy.mtfuji.dto;

import org.generation.italy.mtfuji.model.Booking;
import org.generation.italy.mtfuji.model.Room;
import org.generation.italy.mtfuji.model.User;

import java.time.LocalDate;

public class BookingDTO {

    private long id;
    private long userId;
    private long quantity;
    private String checkIn;
    private String checkOut;
    private String reservationDate;
    private long roomId;
    private boolean paid;
    private float cost;
    private boolean isPromotion;


    public BookingDTO() {
    }

    public BookingDTO(Booking booking) {
        this.id = booking.getId();
        this.userId = booking.getUser().getId();
        this.quantity = booking.getQuantity();
        this.checkIn = booking.getCheck_in().toString();
        this.checkOut = booking.getCheck_out().toString();
        this.reservationDate = booking.getReservation_date().toString();
        this.paid = booking.isPaid();
        this.roomId = booking.getRoom().getId();
        this.cost = booking.getCost();
        this.isPromotion = booking.isIs_promotion();
    }

    public Booking toBooking() {
        return new Booking(this.id, new User(this.userId), this.quantity,
                LocalDate.parse(this.checkIn), LocalDate.parse(this.checkOut),
                LocalDate.parse(this.reservationDate), new Room(this.roomId),
                this.paid, this.cost, this.isPromotion());
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

    public String getCheckIn() {
        return checkIn;
    }

    public void setCheckIn(String checkIn) {
        this.checkIn = checkIn;
    }

    public String getCheckOut() {
        return checkOut;
    }

    public void setCheckOut(String checkOut) {
        this.checkOut = checkOut;
    }

    public String getReservationDate() {
        return reservationDate;
    }

    public void setReservationDate(String reservationDate) {
        this.reservationDate = reservationDate;
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

    public boolean isPromotion() {
        return isPromotion;
    }

    public void setPromotion(boolean promotion) {
        this.isPromotion = promotion;
    }
}
