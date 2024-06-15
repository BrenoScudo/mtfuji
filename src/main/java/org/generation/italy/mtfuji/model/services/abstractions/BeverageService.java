package org.generation.italy.mtfuji.model.services.abstractions;

import org.generation.italy.mtfuji.model.Beverage;
import org.generation.italy.mtfuji.model.GeneralMenuBeverage;
import org.generation.italy.mtfuji.model.GeneralMenuFood;

import java.util.List;
import java.util.Optional;



public interface BeverageService {

	List<Beverage> getAllBeverage();

	Optional<Beverage> getBeverageById(long id);

	List<Beverage> findByNameLike(String name);

	GeneralMenuBeverage getGeneralMenu();
}
