package service;

import entity.AnimalNotes;
import entity.AnimalType;
import repository.AnimalTypeRepository;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


/**
 * Created by katherine_celeste on 9/1/16.
 */
public class TypeService {

    private AnimalTypeRepository animalTypeRepository;

    public TypeService(AnimalTypeRepository animalTypeRepository) {
        this.animalTypeRepository = animalTypeRepository;
    }

    public ArrayList<AnimalType> listTypes() throws SQLException {
        ArrayList<AnimalType> types = new ArrayList<>();

        ResultSet resultSet = this.animalTypeRepository.listTypes();

        while (resultSet.next()) {
            AnimalType type = new AnimalType(
                    resultSet.getInt("animal_type_id"),
                    resultSet.getString("species")

            );

            types.add(type);
        }
        return types;
    }

    public void createType(String text) throws IOException, SQLException {
        animalTypeRepository.createType(text);
    }

    public int getTypeID(String text) throws IOException, SQLException {
        return animalTypeRepository.getTypeID(text);
    }

    public String getType(int id) throws IOException, SQLException {
        return animalTypeRepository.getType(id);
    }
}
