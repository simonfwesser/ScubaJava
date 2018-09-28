package controleur;

import dataAccess.PlacedOrderDAO;
import entite.Customer;
import entite.OrderLine;
import entite.OrderLineId;
import entite.PlacedOrder;
import entite.Product;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.util.HashSet;
import java.util.Set;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modele.ShoppingCart;
import org.hibernate.exception.ConstraintViolationException;
import org.hibernate.exception.LockAcquisitionException;
import service.Service;

public class InvoiceServlet extends HttpServlet {

    public final String HOME_PAGE = "/home.jsp";
    public final String ERROR_PAGE = "/error.jsp";

    private HttpSession _session = null;
    private Customer _customer = null;
    private ShoppingCart _shoppingCart = null;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        _session = request.getSession();
        _customer = (Customer) _session.getAttribute("customer");
        _shoppingCart = (ShoppingCart) _session.getAttribute("shoppingCart");

        LocalDateTime now = LocalDateTime.now();
        int year = now.getYear();
        int month = now.getMonthValue();
        int day = now.getDayOfMonth();
        int hour = now.getHour();
        int minute = now.getMinute();
        int second = now.getSecond();

        String orderNumber = "";
        orderNumber += day;
        orderNumber += hour;
        orderNumber += minute;
        orderNumber += second;

        PlacedOrder placedOrder = new PlacedOrder(orderNumber, _customer);

        Set<OrderLine> orderLines = new HashSet(0);

        for (Product product : _shoppingCart.getContents().keySet()) {
            // OrderLine(OrderLineId id, PlacedOrder placedOrder, Product product, int quantity, double prix)
            // OrderLineId(Integer sku, String orderNumber)
            orderLines.add(new OrderLine(
                    new OrderLineId(product.getSku(), orderNumber),
                    placedOrder,
                    product,
                    _shoppingCart.getQuantity(product),
                    _shoppingCart.getSum(product)
            ));
        }
        placedOrder.setOrderLines(orderLines);

        PlacedOrderDAO placedOrderDAO = new PlacedOrderDAO();
        placedOrderDAO.openSession();
        String destination = "";
        try {
            // https://www.codejava.net/frameworks/hibernate/hibernate-one-to-many-xml-mapping-example
            placedOrderDAO.beginTransaction();
            placedOrderDAO.persist(placedOrder);
            placedOrderDAO.commitTransaction();
            destination = HOME_PAGE;
        }
        catch (LockAcquisitionException lae) {
            Exception e = new Exception("Error! LockAcquisitionException in InvoiceServlet.");
            request.setAttribute("errorMessage", e.getMessage());
            destination = ERROR_PAGE;
        }
        catch (ConstraintViolationException cve) {
            Exception e = new Exception("Error! ConstraintViolationException.");
            request.setAttribute("errorMessage", e.getMessage());
            destination = ERROR_PAGE;
        }
        finally {
            placedOrderDAO.closeSession();
        }
        _session.removeAttribute("shoppingCart");
        RequestDispatcher rd = request.getRequestDispatcher(destination);
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
