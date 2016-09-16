package creationService;

import repository.AnimalRepository;
import repository.AnimalTypeRepository;
import repository.NoteRepository;
import service.AnimalsService;
import service.NoteService;
import service.TypeService;

import java.io.IOException;

import java.sql.SQLException;

/**
 * Created by katherine_celeste on 9/15/16.
 */
public class AnimalCreation {
    // the JDBC url
    private static String jdbcUrl = "jdbc:postgresql://localhost:5432/animals";

    // the private AnimalsService
    private static AnimalsService service;

    /**
     * This method returns a single AnimalsService that is shared among anything
     * that uses this method to load it.
     * @return AnimalsService
     * @throws ClassNotFoundException
     * @throws SQLException
     * @throws IOException
     */
    public static AnimalsService getAnimalsService() throws ClassNotFoundException, SQLException, IOException {
        // if the AnimalsService hasn't been created yet, then we need to create it.

        if(AnimalCreation.service == null){
            Class.forName("org.postgresql.Driver");

            // create noteRepo/noteService objects
            NoteRepository noteRepo = new NoteRepository(jdbcUrl);
            NoteService noteService = new NoteService(noteRepo);

            // create animalRepository object
            AnimalRepository animalRepository =  new AnimalRepository(jdbcUrl);

            // create typeRepo/typeService objects
            AnimalTypeRepository animalTypeRepository = new AnimalTypeRepository(jdbcUrl);
            TypeService typeService = new TypeService(animalTypeRepository);

            service = new AnimalsService(animalRepository, noteService, typeService);
        }

        return service;

    }

}
