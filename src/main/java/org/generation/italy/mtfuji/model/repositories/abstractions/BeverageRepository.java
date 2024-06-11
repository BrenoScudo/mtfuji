package org.generation.italy.mtfuji.model.repositories.abstractions;


import org.generation.italy.mtfuji.model.Beverage;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BeverageRepository extends JpaRepository<Beverage, Long>{}
