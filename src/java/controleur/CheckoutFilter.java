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

public class CheckoutFilter implements Filter {

    private final String LOGIN_PAGE = "/login.jsp";

    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {

        HttpSession session = ((HttpServletRequest) request).getSession();
        String destination = null;

        Customer customer = (Customer) session.getAttribute("customer");

        if (customer == null) {
            destination = LOGIN_PAGE;
            RequestDispatcher rd = request.getRequestDispatcher(destination);
            rd.forward(request, response);
        }
        else {
            chain.doFilter(request, response);
        }

    }

    public void destroy() {
    }

    public void init(FilterConfig filterConfig) {
    }

}