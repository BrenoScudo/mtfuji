package org.generation.italy.mtfuji.model.services.implementations;

import org.generation.italy.mtfuji.model.User;
import org.generation.italy.mtfuji.model.repositories.abstractions.UserRepository;
import org.generation.italy.mtfuji.model.services.abstractions.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class JpaUserService implements UserService {
    @Autowired
    private UserRepository repo;
    private BCryptPasswordEncoder encoder=new BCryptPasswordEncoder(12);

    @Override
    public User saveUser(User user) {
        user.setPassword(encoder.encode(user.getPassword()));
        System.out.println(user.getPassword());
        return repo.save(user) ;
    }
}
