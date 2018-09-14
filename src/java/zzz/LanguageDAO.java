package zzz;

import dataAccess.IDAO;
import entite.Languages;
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


public class LanguageDAO implements IDAO<Languages, String> {

    private Session session;
    private Transaction transaction;

    public LanguageDAO() {
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
    public void persist(Languages entity) {
        getCurrentSession().save(entity);
    }

   
    @Override
    public void update(Languages entity) {
        getCurrentSession().update(entity);
    }

    @Override
    public Languages findById(String id) {
        Languages language = (Languages) getCurrentSession().get(Languages.class, id);
        return language;
    }

    @Override
    public void delete(Languages entity) {
        getCurrentSession().delete(entity);
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<Languages> findAll() {
        List<Languages> languages = (List<Languages>) getCurrentSession().createQuery("from Language").list();
        return languages;
    }

    @Override
    public void deleteAll() {
        List<Languages> entityList = findAll();
        for (Languages entity : entityList) {
            delete(entity);
        }
    }
}
