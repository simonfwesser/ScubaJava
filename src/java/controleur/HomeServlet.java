package controleur;

import entite.CategoryDetail;
import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import resource.Page;
import service.Service;

public class HomeServlet extends HttpServlet {

    private HttpServletRequest _request = null;
    private HttpServletResponse _response = null;
    private HttpSession _session = null;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        setRequest(request);
        setResponse(response);
        setSession();

        setProductCategoriesForSession();

        forwardTo(Page.HOME);

    }

    ////////////////////////////////////////////////////////////////////////////
    private void setRequest(HttpServletRequest request) {
        _request = request;
    }

    private void setResponse(HttpServletResponse response) {
        _response = response;
    }

    private void setSession() {
        _session = _request.getSession();
    }

    private void setProductCategoriesForSession() {
        List<CategoryDetail> categoryDetails = Service.getAllCategoryDetails();
        _session.setAttribute("listCategoryDetails", categoryDetails);
    }

    private void forwardTo(Page page)
            throws ServletException, IOException {
        RequestDispatcher rd = _request.getRequestDispatcher(page.getUrl());
        rd.forward(_request, _response);
    }

    ////////////////////////////////////////////////////////////////////////////
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
