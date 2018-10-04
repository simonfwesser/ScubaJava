package dataAccess;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;
import resource.DbInfo;

/*
A11 - Programmation d'applications WEB
Projet de session.
Etudiants: 
- GHODBANE, Mohammed El Amine (1895101)
- TOULIATOS, Alexander (9736109)
*/

public class DbConnection {

    private static DbConnection _instance = null;
    private static SessionFactory _sessionFactory = null;
    private static ServletContext _servletContext = null;

    private DbConnection() {
        this.open();
    }

    public static synchronized DbConnection getInstance() {
        if (_instance == null) {
            _instance = new DbConnection();
        }
        return _instance;
    }

    private void open() throws ExceptionInInitializerError {

        try {
            configureSessionFactory();
        }
        catch (Throwable ex) {
            System.err.println("Initial SessionFactory creation failed." + ex.getMessage());
            throw new ExceptionInInitializerError(ex);
        }
    }

    public static void close() {
        _sessionFactory.close();
    }

    public static SessionFactory getSessionFactory() {
        return _sessionFactory;
    }

    public static void setSetServletContext(HttpSession session) {
        _servletContext = session.getServletContext();
    }

    private static void configureSessionFactory() {
        // https://www.codejava.net/frameworks/hibernate/building-hibernate-sessionfactory-from-service-registry
        // https://www.tutorialspoint.com/hibernate/hibernate_configuration.htm
        String dbRealPath = _servletContext.getRealPath(DbInfo.FILEPATH.toString());
        String dbUrl = DbInfo.URL.toString() + dbRealPath;
        Configuration configuration = new Configuration().configure();
        configuration.setProperty("hibernate.connection.driver_class", DbInfo.DRIVER_CLASS.toString());
        configuration.setProperty("hibernate.dialect", DbInfo.DIALECT.toString());
        configuration.setProperty("hibernate.connection.url", dbUrl);
        configuration.setProperty("hibernate.connection.username", DbInfo.USERNAME.toString());
        configuration.setProperty("hibernate.connection.password", DbInfo.PASSWORD.toString());
        StandardServiceRegistryBuilder registry = new StandardServiceRegistryBuilder();
        registry.applySettings(configuration.getProperties());
        ServiceRegistry serviceRegistry = registry.build();
        _sessionFactory = configuration.buildSessionFactory(serviceRegistry);
    }

}
