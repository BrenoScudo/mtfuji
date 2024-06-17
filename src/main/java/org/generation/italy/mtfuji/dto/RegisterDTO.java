package org.generation.italy.mtfuji.dto;

import org.generation.italy.mtfuji.model.User;

public class RegisterDTO {

    private UserDTO user;
    private String password;

    public RegisterDTO(UserDTO user, String password) {
        this.user = user;
        this.password = password;
    }

    public User toUser(){
        return new User(user.getId(), user.getFirstname(),user.getLastname(),user.getAge(),
                user.getEmail(),user.getAddress(), user.isFidelity_card());
    }

    public UserDTO getUser() {
        return user;
    }

    public void setUser(UserDTO user) {
        this.user = user;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
