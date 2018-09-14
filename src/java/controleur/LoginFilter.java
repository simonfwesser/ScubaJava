package controleur;

import entite.Costumer;
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

public class LoginFilter implements Filter {

    public final String ERROR_PAGE = "/error.jsp";

    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {
        
        Service.openDbConnection();
        
        String action = "";
        String email = "";
        String password = "";
        boolean isActionLogin = false;
        boolean isCustomer = false;
        boolean isLoginRight = false;
        HttpSession session = ((HttpServletRequest) request).getSession();
        String destination = "";

        
        action = request.getParameter("action");
        email = request.getParameter("email");
        password = request.getParameter("password");

        isActionLogin = "login".equals(action);
        if (!isActionLogin) {
            //session.invalidate();
            chain.doFilter(request, response);
        }
        else {
            Costumer costumer = Service.getOneCostumer(email);
            isCustomer = (costumer != null);
            if (isCustomer) {
                isLoginRight = password.equals(costumer.getPassword());
                if (isLoginRight) {
                    session.setAttribute("costumer", costumer);
                    chain.doFilter(request, response);
                }
                else {
                    request.setAttribute("errorMessage", "Mot de passe erronné!");
                    destination = ERROR_PAGE;
                    RequestDispatcher rd = request.getRequestDispatcher(destination);
                    rd.forward(request, response);
                }
            }
            else {
                request.setAttribute("errorMessage", "Vous n'êtes pas encore client!");
                destination = ERROR_PAGE;
                RequestDispatcher rd = request.getRequestDispatcher(destination);
                rd.forward(request, response);
            }
        }
        
        Service.closeCostumerSession();
        
    }

    public void destroy() {
    }

    public void init(FilterConfig filterConfig) {
    }
}
