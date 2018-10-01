package controleur;

import dataAccess.DbConnection;
import entite.Customer;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Locale;
import java.util.ResourceBundle;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LogoutServlet extends HttpServlet {

    private final String LOGOUT_PAGE = "/logout.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        Customer costumer = (Customer) session.getAttribute("customer");
        
        String languageCode = (String) session.getAttribute("languageCode");
        ResourceBundle resourceBundle = null;
        Locale currentLocale = new Locale(languageCode);

        resourceBundle = ResourceBundle.getBundle("WebsiteResource", currentLocale);
        String goodbyeMessage = resourceBundle.getString("logout.goodbyeMessage") 
                +", " 
                +costumer.getFirstName() 
                + " " 
                + costumer.getLastName() 
                + " !";

        request.setAttribute("goodbyeMessage", goodbyeMessage);

        session.invalidate();

        RequestDispatcher disp = request.getRequestDispatcher(LOGOUT_PAGE);
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
