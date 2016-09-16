package service;

import apple.laf.JRSUIConstants;
import entity.Animal;
import entity.AnimalNotes;
import repository.AnimalRepository;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by katherine_celeste on 8/16/16.
 */
public class AnimalsService {

    private AnimalRepository animalRepository;
    private NoteService noteService;
    private TypeService typeService;

    public AnimalsService(AnimalRepository animalRepository, NoteService noteService, TypeService typeService) {
        this.animalRepository = animalRepository;
        this.noteService = noteService;
        this.typeService = typeService;
    }

    public NoteService getNoteService() {
        return noteService;
    }

    public TypeService getTypeService() {
        return typeService;
    }

    public ArrayList<Animal> listAnimals(int animalID) {
        ArrayList<Animal> animals = new ArrayList<Animal>();

        try {
            ResultSet resultSet = this.animalRepository.listAnimal();

            while (resultSet.next()) {
                Animal anAnimal = new Animal(
                        resultSet.getString("animal_name"),
                        resultSet.getInt("animal_type_id"),
                        resultSet.getString("breed"),
                        resultSet.getString("description"),
                        resultSet.getInt("animal_id"),
                        noteService.listNotes(animalID),
                        this.getTypeService()
                );
                animals.add(anAnimal);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return animals;
    }

    public ArrayList<Animal> listAnimals(String name, Integer typeId, Integer id) throws SQLException {
        ResultSet resultSet = animalRepository.listAnimal(name, typeId, id);

        ArrayList<Animal> animals = new ArrayList<>();

        while (resultSet.next()){
            Animal animal = new Animal(
                    resultSet.getString("animal_name"),
                    resultSet.getInt("animal_type_id"),
                    resultSet.getString("breed"),
                    resultSet.getString("description"),
                    resultSet.getInt("animal_id"),
                    new ArrayList<>(),
                    this.getTypeService()
            );

            // get the notes
            ArrayList<AnimalNotes> notes = noteService.listNotes(animal.getID());

            animal.setNotes(notes);


            animals.add(animal);
        }

        return animals;
    }

    public void createAnimal(String name, int species, String breed, String description) throws IOException, SQLException {
        animalRepository.createAnimal(name, species, breed, description);

    }

    public void removeAnAnimal(int index) throws SQLException {
        animalRepository.removeAnimal(index);
    }

    public Animal getAnimalById(int index) throws SQLException {
        Animal placeHolder = new Animal();
        for (Animal animal : listAnimals(index)) {
            if (animal.getID() == index) {
                return animal;
            }
        }
        System.out.println("\nThere is no animal with that ID. Please try again.");

        return placeHolder;
    }

//    public ArrayList<Animal> getAnimalsByType(int type) throws SQLException {
//        ResultSet resultSet = animalRepository.getResultSet();
//
//        ArrayList<Animal> animals = new ArrayList<Animal>();
//
//        Animal anAnimal;
//
//        while (resultSet.next()) {
//            if (resultSet.getInt("animal_type_id") == type) {
//                anAnimal = new Animal(
//                        resultSet.getString("animal_name"),
//                        resultSet.getInt("animal_type_id"),
//                        resultSet.getString("breed"),
//                        resultSet.getString("description"),
//                        resultSet.getInt("animal_id"),
//                        noteService.listNotes(),
//                        this.typeService
//
//
//                );
//                animals.add(anAnimal);
//            }
//        }
//        return animals;
//    }

//    public ArrayList<Animal> getAnimalsByName(String type) throws SQLException {
//        ResultSet resultSet = animalRepository.getResultSet();
//
//        ArrayList<Animal> animals = new ArrayList<Animal>();
//
//        Animal anAnimal = null;
//
//        while (resultSet.next()) {
//            if (resultSet.getString("animal_name").toLowerCase().contains(type.toLowerCase())) {
//                anAnimal = new Animal(
//                        resultSet.getString("animal_name"),
//                        resultSet.getInt("animal_type_id"),
//                        resultSet.getString("breed"),
//                        resultSet.getString("description"),
//                        resultSet.getInt("animal_id"),
//                        noteService.listNotes(),
//                        typeService
//
//                );
//                animals.add(anAnimal);
//            }
//        }
//        return animals;
//    }

    public void modifyAnimal(Animal animal) throws SQLException, IOException {

                animalRepository.modifyAnimal(animal);



}}