package org.generation.italy.mtfuji.dto;

import org.generation.italy.mtfuji.model.Food;
import org.generation.italy.mtfuji.model.Menu;

import java.util.ArrayList;
import java.util.List;

public class MenuDTO {

    private List<FoodDTO> snacks = new ArrayList<>();
    private List<FoodDTO> sandwiches = new ArrayList<>();
    private List<FoodDTO> salads = new ArrayList<>();
    private List<FoodDTO> desserts = new ArrayList<>();
    private List<FoodDTO> friedFoods = new ArrayList<>();
    private List<FoodDTO> specialFoods = new ArrayList<>();

    public MenuDTO(Menu m) {
        m.getSnacks().stream().map(FoodDTO::new).forEach(snacks::add);
        m.getSandwiches().stream().map(FoodDTO::new).forEach(sandwiches::add);
        m.getSalads().stream().map(FoodDTO::new).forEach(salads::add);
        m.getDesserts().stream().map(FoodDTO::new).forEach(desserts::add);
        m.getFriedFoods().stream().map(FoodDTO::new).forEach(friedFoods::add);
        m.getSpecialFoods().stream().map(FoodDTO::new).forEach(specialFoods::add);
    }

    public List<FoodDTO> getSnacks() {
        return snacks;
    }

    public List<FoodDTO> getSandwiches() {
        return sandwiches;
    }

    public List<FoodDTO> getSalads() {
        return salads;
    }

    public List<FoodDTO> getDesserts() {
        return desserts;
    }

    public List<FoodDTO> getSpecialFoods() {
        return specialFoods;
    }

    public List<FoodDTO> getFriedFoods() {
        return friedFoods;
    }
}
