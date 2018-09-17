
package controleur;


import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import service.Service;

public class Traitement extends HttpServlet {
    
    private HttpSession session;
    private final String HOME_PAGE = "/home.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {   
        
        session = request.getSession();
        
        Service.openDbConnection();
        
        String languageCode = (String)session.getAttribute("languageCode");
        Service.setLanguage(languageCode);   
        session.setAttribute("language", Service.getLanguage());
        session.setAttribute("listLanguages", Service.getAllLanguages());
        session.setAttribute("listCategoryDetails", Service.getAllCategoryDetails());

//        if(!session.isNew()){
//            session.invalidate();
//            session = request.getSession();   
//        }
//        
//        session.setAttribute("listProducts", Service.getAllProducts());
//        //session.setAttribute("listDetails", gestion.getListDetail());
//        //session.setAttribute("listLanguages", gestion.getListLanguages());
        

        RequestDispatcher disp = request.getRequestDispatcher(HOME_PAGE);
        disp.forward(request, response);
        
        // ??? Bon de faire ca ici?
        Service.closeProductSession();
        Service.closeCategorySession();
        
        //TODO fermer le sessionFactory à la destruction de l'application,
        //lorsque plus aucun client n'est sur le site.
        //
//        Service.closeDbConnection();

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
