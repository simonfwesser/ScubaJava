package controleur;

import entite.Product;
import java.io.IOException;
import java.util.Locale;
import java.util.ResourceBundle;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modele.ShoppingCart;
import resource.Page;
import service.ProductService;

public class ShoppingCartServlet extends HttpServlet {

    HttpSession _session = null;
    private String _action = "";
    private int _quantity = 0;
    private Product _product = null;
    private ShoppingCart _shoppingCart = null;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        _action = request.getParameter("action");
        _session = request.getSession();
        String destination = "";

        _shoppingCart = (ShoppingCart) _session.getAttribute("shoppingCart");

        if (!"delete".equals(_action)) {

            String quantity = request.getParameter("quantity");
            String sku = request.getParameter("sku");
            _product = ProductService.getOne(sku);

            try {
                _quantity = Integer.parseInt(quantity);
            }
            catch (Exception e) {
                _quantity = 0;
                ResourceBundle resourceBundle = (ResourceBundle)_session.getAttribute("resourceBundle");
                String specificError = resourceBundle.getString("error.specificErrorQuantity");
                request.setAttribute("specificError", specificError);
                destination = Page.ERROR.getUrl();
            }

            if (_quantity > ProductService.getOne(sku).getQuantity()) {
                String languageCode = (String) _session.getAttribute("languageCode");
                ResourceBundle resourceBundle = null;
                Locale currentLocale = new Locale(languageCode);
                resourceBundle = ResourceBundle.getBundle("resource.WebsiteProperties", currentLocale);
                String specificError = resourceBundle.getString("error.specificErrorStock");
                request.setAttribute("specificError", specificError);
                destination = Page.ERROR.getUrl();
            }
            else if (_quantity != 0) {
                if (_shoppingCart.isEmpty()) {
                    _shoppingCart.put(_product, _quantity);
                }
                else {
                    if (_shoppingCart.contains(_product)) {
                        _shoppingCart.put(_product, _shoppingCart.getQuantity(_product) + _quantity);
                    }
                    else {
                        _shoppingCart.put(_product, _quantity);
                    }
                }
                destination = Page.HOME.getUrl();
            }

        }
        else {
            String sku = request.getParameter("sku");
            _product = ProductService.getOne(sku);
            _shoppingCart.remove(_product);
            destination = Page.HOME.getUrl();
        }

        _session.setAttribute("shoppingCart", _shoppingCart);
        RequestDispatcher disp = request.getRequestDispatcher(destination);
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
