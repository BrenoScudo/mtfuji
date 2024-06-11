package org.generation.italy.mtfuji.model.services.implementations;

import org.generation.italy.mtfuji.model.Beverage;
import org.generation.italy.mtfuji.model.repositories.abstractions.BeverageRepository;
import org.generation.italy.mtfuji.model.services.abstractions.BeverageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class JpaBeverageService implements BeverageService {

    private final BeverageRepository beverageRepository;

    @Autowired
    public JpaBeverageService(BeverageRepository beverageRepository) {
        this.beverageRepository = beverageRepository;
    }

    @Override
    public List<Beverage> getAllBeverage() {
        return beverageRepository.findAll();
    }

    @Override
    public Optional<Beverage> getBeverageById(long id) {
        return Optional.empty();
    }

    @Override
    public List<Beverage> findByNameLike(String name) {
        return List.of();
    }
}
