package zzz;

import dataAccess.IDAO;
import entite.Administrator;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;

/**
 *
 * @author 1895101
 */


public class AdministratorDAO implements IDAO<Administrator, String> {

    private Session session;
    private Transaction transaction;

    public AdministratorDAO() {
    }

    public Session openCurrentSession() {
        session = getSessionFactory().openSession();
        return session;
    }

    public Session openCurrentSessionWithTransaction() {
        session = getSessionFactory().openSession();
        transaction = session.beginTransaction();
        return session;
    }

    public void closeCurrentSession() {
        session.close();
    }

    public void closeCurrentSessionWithTransaction() {
        transaction.commit();
        session.close();
    }

    private static SessionFactory getSessionFactory() {
        Configuration configuration = new Configuration().configure();
        StandardServiceRegistryBuilder builder = new StandardServiceRegistryBuilder()
                .applySettings(configuration.getProperties());
        SessionFactory sessionFactory = configuration.buildSessionFactory(builder.build());
        return sessionFactory;
    }

    public Session getCurrentSession() {
        return session;
    }

    public void setCurrentSession(Session currentSession) {
        this.session = currentSession;
    }

    public Transaction getCurrentTransaction() {
        return transaction;
    }

    public void setCurrentTransaction(Transaction currentTransaction) {
        this.transaction = currentTransaction;
    }

    @Override
    public void persist(Administrator entity) {
        getCurrentSession().save(entity);
    }

   
    @Override
    public void update(Administrator entity) {
        getCurrentSession().update(entity);
    }

    @Override
    public Administrator findById(String id) {
        Administrator administrator = (Administrator) getCurrentSession().get(Administrator.class, id);
        return administrator;
    }

    @Override
    public void delete(Administrator entity) {
        getCurrentSession().delete(entity);
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<Administrator> findAll() {
        List<Administrator> administrators = (List<Administrator>) getCurrentSession().createQuery("from Administrator").list();
        return administrators;
    }

    @Override
    public void deleteAll() {
        List<Administrator> entityList = findAll();
        for (Administrator entity : entityList) {
            delete(entity);
        }
    }
}