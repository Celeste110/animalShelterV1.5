package servlet;

import entity.Animal;
import entity.AnimalNotes;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

/**
 * Created by katherine_celeste on 9/14/16.
 */

@WebServlet("/note")
public class notePgServlet extends AbstractServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      try {
        // get the animal id
        Integer id = getParameterAsInt(req, "id");
        req.setAttribute("id", id);

        // get the animal
        Animal animal = service.getAnimalById(id);

        req.setAttribute("animal", animal);

    } catch (SQLException e) {
        throw new ServletException("Error showing widget notes", e);
    }

        req.getRequestDispatcher("WEB-INF/note.jsp").forward(req, resp);
}

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        try {
            // get the id of the animal we're adding a note to
            Integer id = getParameterAsInt(req, "id");
            req.setAttribute("id", id);

            // get the animal
            Animal animal = service.getAnimalById(id);

            // get the text of the note
            String noteText = getParameterAsString(req, "note");

            // make a note
            AnimalNotes note = new AnimalNotes(id, noteText, new java.util.Date().toString());

            // add the note to the animal
            animal.getNotes().add(note);

            // save the widget
            service.modifyAnimal(animal);
            
            resp.sendRedirect("/note?id=" + id);
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

}
