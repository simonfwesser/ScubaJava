package dataAccess;

import dataAccess.IDAO;
import java.io.Serializable;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

public abstract class DAO<T, K> implements IDAO {

    protected SessionFactory _sessionFactory;
    protected Session _session;
    protected Transaction _transaction;

    ////////////////////////////////////////////////////////////////
    
    public DAO() {
        _sessionFactory = DbConnection.getInstance().getSessionFactory();
    }

    ////////////////////////////////////////////////////////////////
    @Override
    public void openSession() {
        _session = _sessionFactory.openSession();
    }

    @Override
    public void closeSession() {
        _session.close();
    }

    @Override
    public void beginTransaction() {
        _transaction = _session.beginTransaction();
    }

    @Override
    public void commitTransaction() {
        _transaction.commit();
    }
    
    ////////////////////////////////////////////////////////////////

    public abstract void persist(T entity);

    public abstract void  update(T entity);
    
    public abstract T getOne(K primaryKey);
    
    public abstract List<T> getAll();
    
    public abstract void deleteOne(T entity);

    public abstract void deleteAll();
    
    //Pour test
    public boolean wasCommited(){
        return this._transaction.wasCommitted();
    }

}
