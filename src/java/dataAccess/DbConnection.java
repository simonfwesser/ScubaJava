
package dataAccess;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.AnnotationConfiguration;

public class DbConnection {
    
    private static DbConnection _instance = null;
    private static SessionFactory _sessionFactory = null;
    
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
        try {

            _sessionFactory = new AnnotationConfiguration().configure().buildSessionFactory();
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
    
}
