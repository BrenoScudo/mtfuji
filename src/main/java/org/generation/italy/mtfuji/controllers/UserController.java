package org.generation.italy.mtfuji.controllers;

import org.generation.italy.mtfuji.dto.TokenDTO;
import org.generation.italy.mtfuji.dto.UserDTO;
import org.generation.italy.mtfuji.model.User;
import org.generation.italy.mtfuji.model.services.abstractions.JwtService;
import org.generation.italy.mtfuji.model.services.abstractions.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping()
public class UserController {

    private UserService service;
    private JwtService jwtService;
    AuthenticationManager authenticationManager;

    @Autowired
    public UserController(UserService service, JwtService jwtService, AuthenticationManager authenticationManager) {
        this.service = service;
        this.jwtService = jwtService;
        this.authenticationManager = authenticationManager;
    }

    @PostMapping("/register")
    public User register(@RequestBody UserDTO user) {
        return service.saveUser(user.toUser());
    }

    @PostMapping("/login")
    public ResponseEntity<?> login(@RequestBody UserDTO user){

        Authentication authentication = authenticationManager
                .authenticate(new UsernamePasswordAuthenticationToken(user.getEmail(), user.getPassword()));

        if(authentication.isAuthenticated())
            return ResponseEntity.ok(new TokenDTO(jwtService.generateToken(user.getEmail())));
        else
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("Login Failed");
    }
}
