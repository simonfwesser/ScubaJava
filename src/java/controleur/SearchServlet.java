package controleur;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import entite.Product;
import java.io.IOException;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import service.Service;

public class SearchServlet extends HttpServlet {

    HttpSession session;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        session = request.getSession();

        List<Product> products = (ArrayList) Service.getAllProducts();

        String jsonString = "";
        int nProductsByName = products.size();
        jsonString += "[";
        for (int i = 0; i < nProductsByName; i++) {
            jsonString += "{";
            jsonString += "\"name\"" + " : " + "\"" + products.get(i).getName() + "\"";
            jsonString += " , ";
            jsonString += "\"sku\"" + " : " + "\"" + products.get(i).getSku() + "\"";
            jsonString += "}";
            jsonString += (i != nProductsByName - 1 ? "," : "");
        }
        jsonString += "]";

        String resultJson = jsonString;

        response.setContentType("text/html");

        response.getWriter().print(resultJson);
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
