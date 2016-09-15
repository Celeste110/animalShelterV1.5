package servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by katherine_celeste on 9/14/16.
 */

//@WebServlet("/addOrEdit")
public class addOrEditPgServlet extends HttpServlet {
    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

       // req.getRequestDispatcher("WEB-INF/AddOrEditAnimal.jsp").forward(req, resp);
    }
}
