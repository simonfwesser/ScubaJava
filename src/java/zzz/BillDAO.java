package zzz;

import dataAccess.IDAO;
import entite.Bill;
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


public class BillDAO implements IDAO<Bill, String> {

    private Session session;
    private Transaction transaction;

    public BillDAO() {
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
    public void persist(Bill entity) {
        getCurrentSession().save(entity);
    }

   
    @Override
    public void update(Bill entity) {
        getCurrentSession().update(entity);
    }

    @Override
    public Bill findById(String id) {
        Bill bill = (Bill) getCurrentSession().get(Bill.class, id);
        return bill;
    }

    @Override
    public void delete(Bill entity) {
        getCurrentSession().delete(entity);
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<Bill> findAll() {
        List<Bill> bills = (List<Bill>) getCurrentSession().createQuery("from Bill").list();
        return bills;
    }

    @Override
    public void deleteAll() {
        List<Bill> entityList = findAll();
        for (Bill entity : entityList) {
            delete(entity);
        }
    }
}
