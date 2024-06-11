package org.generation.italy.nomeprogetto.model.repositories.abstractions;

import org.generation.italy.nomeprogetto.model.Beverage;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BeverageRepository extends JpaRepository<Beverage, Long>{}
