package controleur;

import entite.Customer;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import service.Service;

public class SignUpServlet extends HttpServlet {

    public final String HOME_PAGE = "/home.jsp";
    public final String ERROR_PAGE = "/error.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        String email;
        String firstname;
        String lastname;
        String address;
        String password;

        email = (String) request.getParameter("email");
        firstname = (String) request.getParameter("firstname");
        lastname = (String) request.getParameter("lastname");
        password = (String) request.getParameter("password");
        address = (String) request.getParameter("address");

        Customer customer = new Customer(email, firstname, lastname, password, address);
        String destination = "";

        try {
            Service.addCustomer(customer);
            session.setAttribute("customer", customer); //On passe le client de requête à session
            destination = HOME_PAGE;
        }
        catch (Exception e) {
            request.setAttribute("errorMessage", e.getMessage());
            request.setAttribute("customer", null); //Par sécurité
            destination = ERROR_PAGE;
        }

        RequestDispatcher rd = request.getRequestDispatcher(destination);
        rd.forward(request, response);

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
