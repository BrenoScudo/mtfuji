package org.generation.italy.mtfuji.dto;


import org.generation.italy.mtfuji.model.User;

public class UserDTO {

    private long id;
    private String firstname;
    private String lastname;
    private long age;
    private String email;
    private String address;
    private boolean fidelity_card;
    //private List<Booking> reservations = new ArrayList<>();


    public UserDTO(User user) {
        this.id = user.getId();
        this.firstname = user.getFirstname();
        this.lastname = user.getLastname();
        this.age = user.getAge();
        this.email = user.getEmail();
        this.address = user.getAddress();
        this.fidelity_card = user.isFidelity_card();
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
}
