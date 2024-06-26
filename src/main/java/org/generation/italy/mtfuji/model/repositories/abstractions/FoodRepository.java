package org.generation.italy.mtfuji.model.repositories.abstractions;

import org.generation.italy.mtfuji.model.Food;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface FoodRepository extends JpaRepository<Food,Long> {

    List<Food> findAllByOrderByName();
}
