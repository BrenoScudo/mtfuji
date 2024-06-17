package org.generation.italy.mtfuji.controllers;

import org.generation.italy.mtfuji.dto.LoginDTO;
import org.generation.italy.mtfuji.dto.RegisterDTO;
import org.generation.italy.mtfuji.dto.TokenResponseDTO;
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
    public RegisterDTO register(@RequestBody RegisterDTO registerDTO) {
        User user = registerDTO.toUser();
        User savedUser = service.saveUser(user);
        UserDTO userDto = new UserDTO(savedUser);
        return new RegisterDTO(userDto, user.getPassword());
    }

    @PostMapping("/login")
    public ResponseEntity login(@RequestBody LoginDTO loginDTO) {

        Authentication authentication = authenticationManager
                .authenticate(new UsernamePasswordAuthenticationToken(loginDTO.getEmail(), loginDTO.getPassword()));
        var builder = TokenResponseDTO.builder();
        TokenResponseDTO dto = null;
        if (authentication.isAuthenticated()){
            dto = builder.setToken(jwtService.generateToken(loginDTO.getEmail())).build();
            return ResponseEntity.ok(dto);
        }
        dto = builder.setErrorMessage("Login failed").build();
        return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(dto);
    }
}
