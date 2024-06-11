package org.generation.italy.nomeprogetto.model.services.abstractions;

import java.util.List;
import java.util.Optional;

import org.generation.italy.nomeprogetto.model.Beverage;

public interface BeverageService {

	Beverage createBeverage(Beverage beverage);

	List<Beverage> getAllBeverage();

	Optional<Beverage> getBeverageById(long id);

	Beverage updateBeverage(Beverage beverage);

	void deleteBeverageById(long id);

	List<Beverage> findByNameLike(String name);
}
