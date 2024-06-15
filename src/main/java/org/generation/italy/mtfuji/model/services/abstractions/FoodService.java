package org.generation.italy.mtfuji.model.services.abstractions;

import org.generation.italy.mtfuji.model.Food;
import org.generation.italy.mtfuji.model.GeneralMenuFood;

import java.util.List;
import java.util.Optional;

public interface FoodService {
    List<Food> getAllFood();

    Optional<Food> getFoodById(long id);

    List<Food> findByNameLike(String name);

    GeneralMenuFood getGeneralMenu();
}

