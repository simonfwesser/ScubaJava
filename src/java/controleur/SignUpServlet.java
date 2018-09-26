
package controleur;

import entite.Customer;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import service.Service;

public class SignUpServlet extends HttpServlet {
    
    public final String HOME_PAGE = "/home.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        
        String email;
        String firstname;
        String lastname;
        String address;
        String password;
        
        email = (String) request.getParameter("email");
        firstname  = (String) request.getParameter("firstname");
        lastname  = (String) request.getParameter("lastname");
        address  = (String) request.getParameter("address");
        password = (String) request.getParameter("password");
        
        Customer customer = new Customer(email, firstname, lastname, address, password);
        
        Service.addCustomer(customer);
        
        session.setAttribute("customer", customer); //On passe le client de requête à session
        RequestDispatcher rd = request.getRequestDispatcher(HOME_PAGE);
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
