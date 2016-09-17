package servlet;

import entity.Animal;
import entity.AnimalType;

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


@WebServlet("") //web root path
public class mainPgServlet extends AbstractServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            // get the parameters from the query string (if provided, otherwise null)
            String name = getParameterAsString(req, "name");
            req.setAttribute("name", name);

            Integer typeId = getParameterAsInt(req, "typeId");
            req.setAttribute("typeId", typeId);

            Integer id = getParameterAsInt(req, "id");
            req.setAttribute("id", id);

            // list the animal types we have
            ArrayList<AnimalType> types = service.getTypeService().listTypes();
            req.setAttribute("types", types);

            // list the animals matching the search criteria, if any
            ArrayList<Animal> animals = service.listAnimals(name, typeId, id);
            req.setAttribute("animals", animals);

        } catch (SQLException e) {
            throw new ServletException("Something went wrong doing stuff!", e);
        }

        // forward the request to JSP file
        req.getRequestDispatcher("WEB-INF/index.jsp").forward(req, resp);

    }
}