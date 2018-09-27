package dataAccess;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.AnnotationConfiguration;

public class DbConnection {

    private final String SQLITE_DB = "/WEB-INF/web_database.db";

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

    private void open() {
        // Problem with this code, doesn't allow to close sessionFactory
//        Configuration configuration = new Configuration().configure();
//        StandardServiceRegistryBuilder builder = new StandardServiceRegistryBuilder()
//                .applySettings(configuration.getProperties());
//        _sessionFactory = configuration.buildSessionFactory(builder.build()); 

        String dbRealPath = _servletContext.getRealPath("../../web/" +SQLITE_DB);
        String dbUrl = "jdbc:sqlite:" + dbRealPath;
        System.out.println("*****/n*****/n*****/n*****/n");
        System.out.println("dbUrl : " +dbRealPath);
        System.out.println("dbUrl : " +dbUrl);
        System.out.println("*****/n*****/n*****/n*****/n");
        try {
            AnnotationConfiguration conf = new AnnotationConfiguration().configure();
            conf.setProperty("hibernate.connection.url", dbUrl);
            _sessionFactory = conf.buildSessionFactory();
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
