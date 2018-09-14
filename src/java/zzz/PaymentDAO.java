package zzz;

import dataAccess.IDAO;
import entite.Payment;
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


public class PaymentDAO implements IDAO<Payment, String> {

    private Session session;
    private Transaction transaction;

    public PaymentDAO() {
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
    public void persist(Payment entity) {
        getCurrentSession().save(entity);
    }

   
    @Override
    public void update(Payment entity) {
        getCurrentSession().update(entity);
    }

    @Override
    public Payment findById(String id) {
        Payment payment = (Payment) getCurrentSession().get(Payment.class, id);
        return payment;
    }

    @Override
    public void delete(Payment entity) {
        getCurrentSession().delete(entity);
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<Payment> findAll() {
        List<Payment> payments = (List<Payment>) getCurrentSession().createQuery("from Payment").list();
        return payments;
    }

    @Override
    public void deleteAll() {
        List<Payment> entityList = findAll();
        for (Payment entity : entityList) {
            delete(entity);
        }
    }
}