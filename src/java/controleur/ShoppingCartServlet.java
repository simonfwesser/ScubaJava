package controleur;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ShoppingCartServlet extends HttpServlet {

    HttpSession _session;
    private int _quantity;
    private String _sku;
    private HashMap<String, Integer> _shoppingCart;
    private int _nbItems;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String quantity = request.getParameter("quantity");
        String sku = request.getParameter("sku");
        _quantity = Integer.parseInt(quantity);
        _sku = sku;

        _session = request.getSession();

        _shoppingCart = (HashMap) _session.getAttribute("shoppingCart");
        if (_shoppingCart == null) {
            _shoppingCart = new HashMap();
        }

        if (_shoppingCart.isEmpty()) {
            _shoppingCart.put(_sku, _quantity);
        } else {
            if (!_shoppingCart.containsKey(_sku)) {
                _shoppingCart.put(_sku, _quantity);
            } else {
                _shoppingCart.put(_sku, _shoppingCart.get(_sku) + _quantity);
            }
        }
        
        _nbItems = this.getNbItems();

        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet testServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet testServlet at " + request.getContextPath() + "</h1>");

            Iterator it = _shoppingCart.entrySet().iterator();
            while (it.hasNext()) {
                Map.Entry pair = (Map.Entry) it.next();
                out.println("<h1>Product sku: " + (pair.getKey()) + "</h1>");
                out.println("<h1>Total quantity: " + (pair.getValue()) + "</h1>");
//                it.remove(); // avoids a ConcurrentModificationException
            }

            out.println("</body>");
            out.println("</html>");
        }

        _session.setAttribute("shoppingCart", _shoppingCart);
        _session.setAttribute("nbItems", _nbItems);

    }

    
   
    private int getNbItems() {
        int nbItems = 0;
        Iterator it = _shoppingCart.entrySet().iterator();
        while (it.hasNext()) {
            Map.Entry pair = (Map.Entry) it.next();
            nbItems += ((Integer)pair.getValue()).intValue();
        }
        return nbItems;

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
