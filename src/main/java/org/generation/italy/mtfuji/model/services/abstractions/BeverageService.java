package org.generation.italy.mtfuji.model.services.abstractions;

import org.generation.italy.mtfuji.model.Beverage;

import java.util.List;
import java.util.Optional;



public interface BeverageService {

	Beverage createBeverage(Beverage beverage);

	List<Beverage> getAllBeverage();

	Optional<Beverage> getBeverageById(long id);

	Beverage updateBeverage(Beverage beverage);

	void deleteBeverageById(long id);

	List<Beverage> findByNameLike(String name);
}
