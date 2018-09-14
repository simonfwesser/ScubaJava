package zzz;

import dataAccess.IDAO;
import entite.Orders;
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


public class OrdersDAO implements IDAO<Orders, String> {

    private Session session;
    private Transaction transaction;

    public OrdersDAO() {
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
    public void persist(Orders entity) {
        getCurrentSession().save(entity);
    }

   
    @Override
    public void update(Orders entity) {
        getCurrentSession().update(entity);
    }

    @Override
    public Orders findById(String id) {
        Orders order = (Orders) getCurrentSession().get(Orders.class, id);
        return order;
    }

    @Override
    public void delete(Orders entity) {
        getCurrentSession().delete(entity);
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<Orders> findAll() {
        List<Orders> orders = (List<Orders>) getCurrentSession().createQuery("from Orders").list();
        return orders;
    }

    @Override
    public void deleteAll() {
        List<Orders> entityList = findAll();
        for (Orders entity : entityList) {
            delete(entity);
        }
    }
}