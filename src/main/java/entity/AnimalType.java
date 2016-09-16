package entity;

/**
 * Created by katherine_celeste on 9/16/16.
 */
public class AnimalType {
    private int animal_type_id;

    private String species;

    public AnimalType(int animal_type_id, String species) {
        this.animal_type_id = animal_type_id;
        this.species = species;
    }

    public int getAnimal_type_id() {
        return animal_type_id;
    }

    public void setAnimal_type_id(int animal_type_id) {
        this.animal_type_id = animal_type_id;
    }

    public String getSpecies() {
        return species;
    }

    public void setSpecies(String species) {
        this.species = species;
    }
}
