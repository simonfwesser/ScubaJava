package zzz;

import dataAccess.IDAO;
import entite.OrderLines;
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


public class OrderLinesDAO implements IDAO<OrderLines, String> {

    private Session session;
    private Transaction transaction;

    public OrderLinesDAO() {
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
    public void persist(OrderLines entity) {
        getCurrentSession().save(entity);
    }

   
    @Override
    public void update(OrderLines entity) {
        getCurrentSession().update(entity);
    }

    @Override
    public OrderLines findById(String id) {
        OrderLines aorderLine = (OrderLines) getCurrentSession().get(OrderLines.class, id);
        return aorderLine;
    }

    @Override
    public void delete(OrderLines entity) {
        getCurrentSession().delete(entity);
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<OrderLines> findAll() {
        List<OrderLines> aorderLines = (List<OrderLines>) getCurrentSession().createQuery("from OrderLines").list();
        return aorderLines;
    }

    @Override
    public void deleteAll() {
        List<OrderLines> entityList = findAll();
        for (OrderLines entity : entityList) {
            delete(entity);
        }
    }
}