/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
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

/**
 *
 * @author 1895101
 */
public class SearchServlet extends HttpServlet {

    HttpSession session;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        session = request.getSession();

        String entredString = request.getParameter("iSearch");
        //ArrayList<Product> productsByName = (ArrayList)Service.getProductsByName(entredString);
        Type listType = new TypeToken<ArrayList<Product>>() {
        }.getType();
        List<Product> productsByName = new ArrayList<Product>();
        productsByName = (ArrayList) Service.getAllProducts();

        String jsonString = "";
        int nProductsByName = productsByName.size();
        jsonString += "[";
        for (int i = 0; i < nProductsByName; i++) {
            jsonString += "{";
            jsonString += " \"sku\" : \"" + productsByName.get(i).getSku() + "\"";
            jsonString += ", ";
            jsonString += " \"name\" : \"" + productsByName.get(i).getName() + "\"";
            jsonString += ", ";
            jsonString += " \"price\" : \"" + productsByName.get(i).getPrice() + "\"";
            jsonString += "}";
            jsonString += (i != nProductsByName - 1 ? "," : "");
        }
        jsonString += "]";

//        Gson gson = new Gson();
//        System.out.println("**********\n***********\n************************");
//        String resultJson = gson.toJson(productsByName, listType);
        String resultJson = jsonString;

//        ArrayList<String> mylist = new ArrayList<String>();
//        mylist.add("abc");
//        mylist.add("cfd");
//        mylist.add("ert");
//        mylist.add("fg");
//        mylist.add("ujk");
//        Gson gson = new Gson();
//        String jsonArray = gson.toJson(mylist);
        //System.out.println(resultJson + "##################################");
        response.setContentType("text/html");

        response.getWriter().print(resultJson);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
