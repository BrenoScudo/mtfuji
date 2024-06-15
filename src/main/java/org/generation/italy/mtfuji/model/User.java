package org.generation.italy.mtfuji.model;

import java.util.ArrayList;
import java.util.List;

import jakarta.persistence.*;

@Entity
@Table(name = "account")
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private long id;
    @Column(name = "firstname")
    private String firstname;
    @Column(name = "lastname")
    private String lastname;
    @Column(name = "age")
    private long age;
    @Column(name = "email")
    private String email;
    @Column(name = "address")
    private String address;
    @Column(name = "fidelity_card")
    private boolean fidelity_card;
    @Column(name = "password")
    private String password;
    @OneToMany(mappedBy = "user")
    private List<Booking> reservations = new ArrayList<>();    

    public User() {
    }

    public User(String firstname, String lastname, long age, String email, String address,
            boolean fidelity_card) {
        this.firstname = firstname;
        this.lastname = lastname;
        this.age = age;
        this.email = email;
        this.address = address;
        this.fidelity_card = fidelity_card;
    }

    public List<Booking> getReservations() {
        return reservations;
    }

    public void setReservations(List<Booking> reservations) {
        this.reservations = reservations;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getFirstname() {
        return firstname;
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    public String getLastname() {
        return lastname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    public long getAge() {
        return age;
    }

    public void setAge(long age) {
        this.age = age;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public boolean isFidelity_card() {
        return fidelity_card;
    }

    public void setFidelity_card(boolean fidelity_card) {
        this.fidelity_card = fidelity_card;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
