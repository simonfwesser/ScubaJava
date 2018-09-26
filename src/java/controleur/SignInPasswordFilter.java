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

public class SignInPasswordFilter implements Filter {

    public final String ERROR_PAGE = "/error.jsp";

    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {

        Service.openDbConnection();

        HttpSession session = ((HttpServletRequest) request).getSession();

        Customer customer = (Customer) request.getAttribute("customer"); //Vient de UsernameFilter
        String password = request.getParameter("password");
        boolean isLoginRight = password.equals(customer.getPassword());
        if (isLoginRight) {
            chain.doFilter(request, response);
        }
        else {
            request.setAttribute("errorMessage", "Mot de passe erronné !");
            request.setAttribute("customer", null); //Par sécurité
            RequestDispatcher rd = request.getRequestDispatcher(ERROR_PAGE);
            rd.forward(request, response);
        }

        chain.doFilter(request, response);

    }

    public void destroy() {
    }

    public void init(FilterConfig filterConfig) {
    }
}
