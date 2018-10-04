package controleur;

import entite.Customer;
import resource.Page;
import modele.Invoice;
import modele.ShoppingCart;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.exception.ConstraintViolationException;
import org.hibernate.exception.LockAcquisitionException;

public class InvoiceServlet extends HttpServlet {

    private HttpSession _session = null;
    private Customer _customer = null;
    private ShoppingCart _shoppingCart = null;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        _session = request.getSession();
        _customer = (Customer) _session.getAttribute("customer");
        _shoppingCart = (ShoppingCart) _session.getAttribute("shoppingCart");

        String destination = "";

        try {
            Invoice.saveOrderInDatabse(_customer, _shoppingCart);
            destination = Page.INVOICE.getUrl();
        }
        catch (LockAcquisitionException lae) {
            request.setAttribute("errorMessage", "Error! LockAcquisitionException in InvoiceServlet.");
            destination = Page.ERROR.getUrl();
        }
        catch (ConstraintViolationException cve) {
            request.setAttribute("errorMessage", "Error! ConstraintViolationException in InvoiceServlet.");
            destination = Page.ERROR.getUrl();
        }

        RequestDispatcher rd = request.getRequestDispatcher(destination);
        rd.forward(request, response);
        
        _session.setAttribute("shoppingCart", new ShoppingCart());

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
