package controleur;

import entite.Customer;
import java.io.IOException;
import java.util.ResourceBundle;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import resource.Page;

/*
A11 - Programmation d'applications WEB
Projet de session.
Etudiants: 
- GHODBANE, Mohammed El Amine (1895101)
- TOULIATOS, Alexander (9736109)
*/

public class LogoutServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        Customer costumer = (Customer) session.getAttribute("customer");
        
        ResourceBundle resourceBundle = (ResourceBundle)session.getAttribute("resourceBundle");
        
        String goodbyeMessage = resourceBundle.getString("logout.goodbyeMessage") 
                +", " 
                +costumer.getFirstName() 
                + " " 
                + costumer.getLastName() 
                + " !";

        request.setAttribute("goodbyeMessage", goodbyeMessage);
        request.setAttribute("backHome", resourceBundle.getString("logout.backHome"));

        session.invalidate();

        RequestDispatcher disp = request.getRequestDispatcher(Page.LOGOUT.getUrl());
        disp.forward(request, response);

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
