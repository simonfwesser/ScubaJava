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
import entite.Languages;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import modele.ShoppingCart;

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
        initializeSession();

        openDatabaseForSession();

        setLanguageForSession();

        continueFilterChain();

    }

    ////////////////////////////////////////////////////////////////
    private void setRequest(ServletRequest request) {
        _request = request;
    }

    private void setResponse(ServletResponse response) {
        _response = response;
    }

    private void initializeSession() {
        // https://stackoverflow.com/questions/30980616
        _session = ((HttpServletRequest) _request).getSession(true);
    }

    private void setFilterChain(FilterChain chain) {
        _chain = chain;
    }

    private void openDatabaseForSession() {
        DbConnection.setSetServletContext(_session);
        Service.openDbConnection();
    }

    private void setLanguageForSession() {
        Locale locale = _request.getLocale();
        String languageCode = locale.getLanguage();
        Service.setServiceLanguage(languageCode);

        Languages language = Service.getServiceLanguage();
        _session.setAttribute("language", language);
        List<Languages> languages = Service.getAllLanguages();
        _session.setAttribute("listLanguages", languages);
        _session.setAttribute("shoppingCart", new ShoppingCart());
    }

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
