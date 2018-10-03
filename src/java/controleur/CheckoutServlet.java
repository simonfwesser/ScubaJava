package controleur;

import entite.Customer;
import entite.Product;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modele.ShoppingCart;
import resource.Page;
import service.ProductService;

public class CheckoutServlet extends HttpServlet {

    HttpSession _session = null;
    private String _action = "";
    private int _quantity = 0;
    private Product _product = null;
    private ShoppingCart _shoppingCart = null;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        _action = request.getParameter("action");
        _session = request.getSession();
        _shoppingCart = (ShoppingCart) _session.getAttribute("shoppingCart");

        Customer customer = (Customer) _session.getAttribute("customer");
        if (customer == null) {
            RequestDispatcher rd = request.getRequestDispatcher(Page.LOGIN.getUrl());
            rd.forward(request, response);
        }
        else {
            if ("delete".equals(_action)) {
                String sku = request.getParameter("sku");
                _product = ProductService.getOne(sku);
                _shoppingCart.remove(_product);

            }

            _session.setAttribute("shoppingCart", _shoppingCart);
            RequestDispatcher disp = request.getRequestDispatcher(Page.CHECKOUT.getUrl());
            disp.forward(request, response);

        }

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
