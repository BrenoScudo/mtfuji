package org.generation.italy.nomeprogetto.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "prices")
public class Prices {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    @ManyToOne
    @JoinColumn(name = "id_room")
    private Room room;
    @Column(columnDefinition = "Numeric")
    private float cost;
    private Integer num_people;
    
    public Prices() {
    }

    public Prices(long id, Room room, float cost, Integer num_people) {
        this.id = id;
        this.room = room;
        this.cost = cost;
        this.num_people = num_people;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public Room getRoom() {
        return room;
    }

    public void setRoom(Room room) {
        this.room = room;
    }

    public float getCost() {
        return cost;
    }

    public void setCost(float cost) {
        this.cost = cost;
    }

    public Integer getNum_people() {
        return num_people;
    }

    public void setNum_people(Integer num_people) {
        this.num_people = num_people;
    }
    
}
