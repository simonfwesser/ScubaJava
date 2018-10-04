package controleur;

import entite.Product;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import service.Service;

/*
A11 - Programmation d'applications WEB
Projet de session.
Etudiants: 
- GHODBANE, Mohammed El Amine (1895101)
- TOULIATOS, Alexander (9736109)
*/

public class SearchServlet extends HttpServlet {

    HttpSession session;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        session = request.getSession();

        List<Product> products = (ArrayList) Service.getAllProducts();

        String jsonString = Product.toJSON(products);
        
        response.setContentType("text/html");
        response.getWriter().print(jsonString);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
