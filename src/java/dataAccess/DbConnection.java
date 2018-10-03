package dataAccess;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.AnnotationConfiguration;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;

public class DbConnection {

    private final String SQLITE_DB = "../../web/WEB-INF/web_database.db";

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

    private void open() throws ExceptionInInitializerError{
        String dbRealPath = _servletContext.getRealPath(SQLITE_DB);
        String dbUrl = "jdbc:sqlite:" + dbRealPath;
        try {
            // https://www.codejava.net/frameworks/hibernate/building-hibernate-sessionfactory-from-service-registry
            // https://www.tutorialspoint.com/hibernate/hibernate_configuration.htm
            Configuration configuration = new Configuration().configure();
            configuration.setProperty("hibernate.connection.driver_class", "org.sqlite.JDBC");
            configuration.setProperty("hibernate.dialect", "dialect.SQLiteDialect");
            configuration.setProperty("hibernate.connection.url", dbUrl);
            configuration.setProperty("hibernate.connection.username", "");
            configuration.setProperty("hibernate.connection.password", "");
            StandardServiceRegistryBuilder registry = new StandardServiceRegistryBuilder();
            registry.applySettings(configuration.getProperties());
            ServiceRegistry serviceRegistry = registry.build();
            _sessionFactory = configuration.buildSessionFactory(serviceRegistry);

        }
        catch (Throwable ex) {
            System.err.println("Initial SessionFactory creation failed." + ex);
            throw new ExceptionInInitializerError(ex);
        }
    }

    public void close() {
        _sessionFactory.close();
    }

    public SessionFactory getSessionFactory() {
        return _sessionFactory;
    }

    public static void setSetServletContext(HttpSession session) {
        _servletContext = session.getServletContext();
    }

}
