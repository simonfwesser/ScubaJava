package controleur;

import entite.Customer;
import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import service.Service;

public class UsernameFilter implements Filter {

    public final String ERROR_PAGE = "/error.jsp";

    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {

        Service.openDbConnection();

        String action = request.getParameter("action");
        String email = request.getParameter("email");
        String destination = "";

        boolean isActionLogin = "login".equals(action);
        if (!isActionLogin) {
            //session.invalidate();
            chain.doFilter(request, response);
        } else {
            Customer customer = Service.getOneCostumer(email);
            System.out.println("*************" +customer.getFirstName());
            
            boolean isCustomer = (customer != null);
            if (isCustomer) {
                request.setAttribute("customer", customer); //Pas encore session
                chain.doFilter(request, response);
            } else {
                request.setAttribute("errorMessage", "Vous n'êtes pas encore client!");
                destination = ERROR_PAGE;
                RequestDispatcher rd = request.getRequestDispatcher(destination);
                rd.forward(request, response);
            }

        }

        Service.closeCustomerSession();
    }

    public void destroy() {
    }

    public void init(FilterConfig filterConfig) {
    }
}