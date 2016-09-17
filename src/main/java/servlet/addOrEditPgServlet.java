package servlet;

import creationService.AnimalCreation;
import entity.Animal;
import entity.AnimalType;
import service.AnimalsService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 * Created by katherine_celeste on 9/14/16.
 */

@WebServlet("/addOrEditPg")
public class addOrEditPgServlet extends AbstractServlet {

    private AnimalsService service;

    @Override
    public void init() throws ServletException {
        try {
            // get our widget service
            this.service = AnimalCreation.getAnimalsService();
        } catch (ClassNotFoundException | SQLException | IOException e) {
            throw new ServletException("Something went wrong initializing servlet" + this.getClass().getCanonicalName() , e);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        // get animal
        try {
            // get animal id from the url
            String id = getParameterAsString(req, "id");

            // create a blank animal
            Animal animal = new Animal();

            // if we've specified an id, then get that specific animal
            if (id != null) {
                // get a specific animal
                animal = service.getAnimalById(Integer.parseInt(id));
            }

            // put the animal into the attributes
            req.setAttribute("animal", animal);

            // animal types for dropdown
            ArrayList<AnimalType> types = service.getTypeService().listTypes();
            req.setAttribute("types", types);

        } catch (SQLException e) {
            throw new ServletException("D'oh! :D", e);
        }

        // forward to the form
        req.getRequestDispatcher("WEB-INF/AddOrEditAnimal.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            // get the posted data

            // animal id
            Integer id = getParameterAsInt(req, "id");
            req.setAttribute("id", id);

            // name
            String name = getParameterAsString(req, "name");
            req.setAttribute("name", name);

            // type
            Integer typeId = getParameterAsInt(req, "typeId");
            req.setAttribute("typeId", typeId);

            // breed
            String breed = getParameterAsString(req, "breed");
            req.setAttribute("breed", breed);

            // description
            String description = getParameterAsString(req, "description");
            req.setAttribute("description", description);

            // get the animal type based on the numeric id that was posted
            String type = service.getTypeService().getType(typeId);

            // declare an animal
            Animal animal;

            // if the id != 0 then we're editing an existing animal
            if (id != null) {
                // get the animal I'm editing
                animal = service.getAnimalById(id);

                // update the animal data
                animal.setName(name);
                animal.setSpecies(typeId);
                animal.setBreed(breed);
                animal.setDescription(description);

            } else {
                // create a new animal using the provided data. No need to set the id, it's already 0
                animal = new Animal(name, typeId, breed, description);
            }

            // TODO: validate the data provided....
            boolean valid = true;

            // if valid (do the work above!!)
            if (valid) {

                // if the id isn't zero we're updating the animal
                if (id != null) {
                    service.modifyAnimal(animal);
                } else {
                    service.createAnimal(animal.getName(), animal.getSpecies(), animal.getBreed(), animal.getDescription());
                }

                // list the animal types we have
                ArrayList<AnimalType> types = service.getTypeService().listTypes();
                req.setAttribute("types", types);

                // list the animals matching the search criteria, if any
                ArrayList<Animal> animals = service.listAnimals(name, typeId, id);
                req.setAttribute("animals", animals);

                req.getRequestDispatcher("WEB-INF/index.jsp").forward(req, resp);

//                // redirect to the list of animals
//                resp.sendRedirect("/main");
//            } else {
//                // TODO: add error messages to the attributes!!
//                req.getRequestDispatcher("WEB-INF/AddOrEditAnimal.jsp").forward(req, resp);
//            }

            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    }