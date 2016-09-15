package servlet;

import entity.Animal;
import repository.AnimalRepository;
import repository.AnimalTypeRepository;
import repository.NoteRepository;
import service.AnimalsService;
import service.NoteService;
import service.TypeService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 * Created by katherine_celeste on 9/14/16.
 */


@WebServlet("") //web root path
public class mainPgServlet extends HttpServlet {

//    public void init() {
//
//    }

    @Override
    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       // private AnimalsService service;


        // you have to parse out what is being submitted b/c HTTP only returns strings
//        String name = req.getPathInfo("Name");
//        name = name.equals("") ? null : name;

        // Use the ServletContext to get the path
        String jdbcUrl = getServletContext().getResource("jdbc:postgresql://localhost:5432/animals").getPath();

        try {
            Class.forName("org.postgresql.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        // create our NoteRepository Service
        NoteRepository noteRepo = null;
        try {
            noteRepo = new NoteRepository(jdbcUrl);
        } catch (SQLException e) {
            throw new ServletException("Something went wrong!", e);
        }

        NoteService noteService = new NoteService(noteRepo);

        AnimalTypeRepository animalTypeRepository = null;
        try {
            animalTypeRepository = new AnimalTypeRepository(jdbcUrl);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        TypeService typeService = new TypeService(animalTypeRepository);

        AnimalRepository animalRepository = null;
        try {
            animalRepository = new AnimalRepository(jdbcUrl);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        AnimalsService service = new AnimalsService(animalRepository, noteService, typeService);

        // Get list of animals from db
        ArrayList<Animal> animals = service.listAnimals();

        req.setAttribute("animals", animals);

        // forward the request to fortune.jsp
        req.getRequestDispatcher("WEB-INF/index.jsp").forward(req, resp);

    }
}
