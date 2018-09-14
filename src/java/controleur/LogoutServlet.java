
package controleur;

import entite.Costumer;
import java.io.IOException;
import java.io.PrintWriter;
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
        
        Costumer costumer = (Costumer)session.getAttribute("costumer");
        String goodbyeMessage = "Au revoir, " +costumer.getFirstName() +" " +costumer.getLastName() +" !";
        
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
