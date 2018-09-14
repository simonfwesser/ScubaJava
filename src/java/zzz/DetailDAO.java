package zzz;

import dataAccess.IDAO;
import entite.Detail;
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


public class DetailDAO implements IDAO<Detail, String> {

    private Session session;
    private Transaction transaction;

    public DetailDAO() {
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
    
    public void persist(Detail entity) {
        getCurrentSession().save(entity);
    }

    public void update(Detail entity) {
        getCurrentSession().update(entity);
    }

    public Detail findById(String id) {
        Detail detail = (Detail) getCurrentSession().get(Detail.class, id);
        return detail;
    }

    public void delete(Detail entity) {
        getCurrentSession().delete(entity);
    }

    public List<Detail> findAll() {
        List<Detail> details = (List<Detail>) getCurrentSession().createQuery("from Detail").list();
        return details;
    }

    public void deleteAll() {
        List<Detail> entityList = findAll();
        for (Detail entity : entityList) {
            delete(entity);
        }
    }
}
