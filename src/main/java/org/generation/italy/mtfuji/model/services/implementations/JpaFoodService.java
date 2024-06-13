package org.generation.italy.mtfuji.model.services.implementations;

import org.generation.italy.mtfuji.model.Food;
import org.generation.italy.mtfuji.model.repositories.abstractions.BeverageRepository;
import org.generation.italy.mtfuji.model.repositories.abstractions.FoodRepository;
import org.generation.italy.mtfuji.model.services.abstractions.FoodService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class JpaFoodService implements FoodService {

    private final FoodRepository foodRepository;

    @Autowired
    public JpaFoodService(FoodRepository foodRepository) {
        this.foodRepository = foodRepository;
    }

    @Override
    public List<Food> getAllFood() {
        return foodRepository.findAll();
    }

    @Override
    public Optional<Food> getFoodById(long id) {
        return foodRepository.findById(id);
    }

    @Override
    public List<Food> findByNameLike(String name) {
        return List.of();
    }
}
