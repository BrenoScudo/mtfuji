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
    private String password;

    public UserDTO() {
    }

    public UserDTO(User user) {
        this.id = user.getId();
        this.firstname = user.getFirstname();
        this.lastname = user.getLastname();
        this.age = user.getAge();
        this.email = user.getEmail();
        this.address = user.getAddress();
        this.fidelity_card = user.isFidelity_card();
        this.password = user.getPassword();
    }

    public User toUser(){
        return new User(this.firstname, this.lastname, this.age, this.email, this.address, this.fidelity_card, this.password);
    }

    public long getId() {
        return id;
    }

    public String getFirstname() {
        return firstname;
    }

    public String getLastname() {
        return lastname;
    }

    public long getAge() {
        return age;
    }

    public String getEmail() {
        return email;
    }

    public String getAddress() {
        return address;
    }

    public boolean isFidelity_card() {
        return fidelity_card;
    }

    public String getPassword() {
        return password;
    }
}
