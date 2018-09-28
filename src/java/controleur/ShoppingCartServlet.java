package controleur;

import entite.Product;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modele.ShoppingCart;
import service.ProductService;

public class ShoppingCartServlet extends HttpServlet {

    private final String HOME_PAGE = "/home.jsp";

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

        if (!"delete".equals(_action)) {

            String quantity = request.getParameter("quantity");
            String sku = request.getParameter("sku");
            _product = ProductService.getOne(sku);
            try {
                _quantity = Integer.parseInt(quantity);
            }
            catch (Exception e) {
                _quantity = 1;
            }

            if (_shoppingCart == null) {
                _shoppingCart = new ShoppingCart();
            }
            
            if (_shoppingCart.isEmpty()) {
                _shoppingCart.put(_product, _quantity);
            }
            else {
                if (!_shoppingCart.contains(_product)) {
                    _shoppingCart.put(_product, _quantity);
                }
                else {
                    _shoppingCart.put(_product, _shoppingCart.getQuantity(_product) + _quantity);
                }
            }
        }
        else if ("delete".equals(_action)) {
            String sku = request.getParameter("sku");
            _product = ProductService.getOne(sku);
            _shoppingCart.remove(_product);

        }

        _session.setAttribute("shoppingCart", _shoppingCart);
        RequestDispatcher disp = request.getRequestDispatcher(HOME_PAGE);
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
