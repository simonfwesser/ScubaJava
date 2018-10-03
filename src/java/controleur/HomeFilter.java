package controleur;

import dataAccess.DbConnection;
import java.io.IOException;
import java.util.Locale;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import service.Service;
import java.util.ResourceBundle;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import modele.ShoppingCart;
import resource.Page;

public class HomeFilter implements Filter {

    private ServletRequest _request = null;
    private ServletResponse _response = null;
    private HttpSession _session = null;
    private FilterChain _chain = null;

    @Override
    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {

        setRequest(request);
        setResponse(response);
        setFilterChain(chain);

        createSession();

        try {
            openDatabaseForSession();
        }
        catch (Throwable t) {
            specifyError(t);
            forwardTo(Page.ERROR);
        }

        initializeSession();
        continueFilterChain();
    }

    ////////////////////////////////////////////////////////////////
    private void setRequest(ServletRequest request) {
        _request = request;
    }

    private void setResponse(ServletResponse response) {
        _response = response;
    }

    private void setFilterChain(FilterChain chain) {
        _chain = chain;
    }

    ////////////////////////////////////////////////////////////////
    private void createSession() {
        // https://stackoverflow.com/questions/30980616
        _session = ((HttpServletRequest) _request).getSession(true);
    }

    private void initializeSession() {
        setLanguageForSession();
        setResourceBundleForSession();
        setShoppingCartForSession();
    }

    private void setLanguageForSession() {
        String languageCode = null;
        languageCode = _request.getParameter("languageCode");
        if (languageCode == null) {
            languageCode = (String) _session.getAttribute("languageCode");
            if (languageCode == null) {
                Locale locale = _request.getLocale();
                languageCode = locale.getLanguage(); 
            }
        }
        _session.setAttribute("languageCode", languageCode);
        Service.setServiceLanguage(languageCode);
    }

    public void setResourceBundleForSession() {
        Locale currentLocale = new Locale((String) _session.getAttribute("languageCode"));
        ResourceBundle resourceBundle = null;
        resourceBundle = ResourceBundle.getBundle("resource.WebsiteProperties", currentLocale);
        _session.setAttribute("resourceBundle", resourceBundle);
    }

    private void setShoppingCartForSession() {
        if (_session.getAttribute("shoppingCart") == null) {
            _session.setAttribute("shoppingCart", new ShoppingCart());
        }
    }
    
    ////////////////////////////////////////////////////////////////

    private void openDatabaseForSession() {
        DbConnection.setSetServletContext(_session);
        Service.openDbConnection();
    }

    ////////////////////////////////////////////////////////////////
    private void specifyError(Throwable t) {
        ResourceBundle resourceBundle = (ResourceBundle) _session.getAttribute("resourceBundle");
        String specificError = resourceBundle.getString("error.specificServerError");
        _request.setAttribute("specificError", specificError +"( " +t.getMessage() +" )");

    }

    private void forwardTo(Page page)
            throws ServletException, IOException {
        RequestDispatcher rd = _request.getRequestDispatcher(page.getUrl());
        rd.forward(_request, _response);
    }

    ////////////////////////////////////////////////////////////////
    private void continueFilterChain()
            throws ServletException, IOException {
        _chain.doFilter(_request, _response);
    }

    ////////////////////////////////////////////////////////////////
    @Override
    public void init(FilterConfig filterConfig) {
    }

    @Override
    public void destroy() {
    }

}
