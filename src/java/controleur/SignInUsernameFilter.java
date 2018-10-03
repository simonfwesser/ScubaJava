package controleur;

import entite.Customer;
import java.io.IOException;
import java.util.Locale;
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

public class SignInUsernameFilter implements Filter {

    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {

        Service.openDbConnection();

        String email = request.getParameter("email");

        Customer customer = Service.getOneCustomer(email);
        boolean isCustomer = (customer != null);
        if (isCustomer) {
            request.setAttribute("customer", customer); //Pas encore dans la session
            chain.doFilter(request, response);
        }
        else {
            HttpServletRequest httpRequest = (HttpServletRequest)request;
            HttpSession session = httpRequest.getSession();
            ResourceBundle resourceBundle = (ResourceBundle)session.getAttribute("resourceBundle");
            String specificError = resourceBundle.getString("error.specificErrorUsername");
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
