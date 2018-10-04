package controleur;

import entite.Customer;
import java.io.IOException;
import java.util.ResourceBundle;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import resource.Page;
import service.Service;

/*
A11 - Programmation d'applications WEB
Projet de session.
Etudiants: 
- GHODBANE, Mohammed El Amine (1895101)
- TOULIATOS, Alexander (9736109)
*/

public class SignInPasswordFilter implements Filter {

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
            request.setAttribute("customer", null);
            request.setAttribute("username", null);
            request.setAttribute("password", null);
            ResourceBundle resourceBundle = (ResourceBundle)session.getAttribute("resourceBundle");
            String specificError = resourceBundle.getString("error.specificErrorPassword");

            request.setAttribute("specificError", specificError);
            RequestDispatcher rd = request.getRequestDispatcher(Page.ERROR.getUrl());
            rd.forward(request, response);
        }

    }

    public void destroy() {
    }

    public void init(FilterConfig filterConfig) {
    }
}
