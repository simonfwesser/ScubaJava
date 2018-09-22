package controleur;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import service.Service;

public class CategoryServlet extends HttpServlet {

    private final String CATEGORY_ITEMS_PAGE = "/category_items.jsp";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String categoryCode = request.getParameter("categoryCode");    
        request.setAttribute("listCategoryProducts", Service.getAllCategoryProducts(categoryCode));
        request.setAttribute("categoryName", Service.getOneCategoryDetail(categoryCode).getCategoryName());
        RequestDispatcher disp = request.getRequestDispatcher(CATEGORY_ITEMS_PAGE);
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
