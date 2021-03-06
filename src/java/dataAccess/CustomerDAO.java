package dataAccess;

import entite.Customer;
import java.util.List;

/*
A11 - Programmation d'applications WEB
Projet de session.
Etudiants: 
- GHODBANE, Mohammed El Amine (1895101)
- TOULIATOS, Alexander (9736109)
*/


public class CustomerDAO extends DAO<Customer, String> {

    public CustomerDAO() {
        super();
    }

    @Override
    public void persist(Customer entity) {
        _session.persist(entity);
        _session.flush();
    }

    @Override
    public void update(Customer entity) {
        _session.update(entity);
    }

    @Override
    public Customer getOne(String primaryKey) {
        return (Customer) _session.get(Customer.class, primaryKey);
    }

    @Override
    public List<Customer> getAll() {
        return (List<Customer>) _session.createQuery("from Customer").list();
    }

    @Override
    public void deleteOne(Customer entity) {
        _session.delete(entity);
    }

    @Override
    public void deleteAll() {
        for (Customer entity : getAll()) {
            deleteOne(entity);
        }
    }

}
