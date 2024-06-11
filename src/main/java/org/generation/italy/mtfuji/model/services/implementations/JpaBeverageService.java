package org.generation.italy.mtfuji.model.services.implementations;

import org.generation.italy.mtfuji.model.Beverage;
import org.generation.italy.mtfuji.model.services.abstractions.BeverageService;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class JpaBeverageService implements BeverageService {
    @Override
    public Beverage createBeverage(Beverage beverage) {
        return null;
    }

    @Override
    public List<Beverage> getAllBeverage() {
        return List.of();
    }

    @Override
    public Optional<Beverage> getBeverageById(long id) {
        return Optional.empty();
    }

    @Override
    public Beverage updateBeverage(Beverage beverage) {
        return null;
    }

    @Override
    public void deleteBeverageById(long id) {

    }

    @Override
    public List<Beverage> findByNameLike(String name) {
        return List.of();
    }
}
