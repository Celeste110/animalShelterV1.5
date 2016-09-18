package servlet;

import creationService.AnimalCreation;
import service.AnimalsService;
import servlet.AbstractServlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

/**
 * Created by win808mac on 9/16/16.
 */
@WebServlet("/delete")
public class deleteServlet extends AbstractServlet {

    private AnimalsService service;

    @Override
    public void init() throws ServletException {
        try {
            // get our widget service
            this.service = AnimalCreation.getAnimalsService();
        } catch (ClassNotFoundException | SQLException | IOException e) {
            throw new ServletException("Something went wrong initializing servlet" + this.getClass().getCanonicalName(), e);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        try {
            // get the animal id
            Integer animalID = getParameterAsInt(req, "id");

            // get the note id
            Integer noteId = getParameterAsInt(req, "noteId");

            if (noteId != null) {
                //delete the note
                service.getNoteService().deleteNote(noteId);
            }
            // if we've specified an id, get that specific animal
            else {
                // delete the animal
                service.removeAnAnimal(animalID);
            }

            resp.sendRedirect("/");

        } catch (SQLException e) {
            throw new ServletException("Couldn't delete animal", e);
        }
    }
}

/**
 * Code used to attach a delete button and function to animal and/or note:
 * <a href="/deleteNote?widgetId=<%= widget.getId() %>&noteId=<%= note.getId() %>"><img src="images/delete.png" alt="Delete" /></a>
 */