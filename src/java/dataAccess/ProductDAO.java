package dataAccess;

import entite.Product;
import java.util.List;

/*
A11 - Programmation d'applications WEB
Projet de session.
Etudiants: 
- GHODBANE, Mohammed El Amine (1895101)
- TOULIATOS, Alexander (9736109)
*/

public class ProductDAO extends DAO<Product, Integer> {

    public ProductDAO() {
        super();
    }

    @Override
    public void persist(Product entity) {
        _session.save(entity);
    }

    @Override
    public void update(Product entity) {
        _session.update(entity);
        _session.flush();
    }

    @Override
    public Product getOne(Integer primaryKey) {
        return (Product) _session.get(Product.class, primaryKey);
    }

    @Override
    public List<Product> getAll() {
        return (List<Product>) _session.createQuery("from Product").list();
    }

    @Override
    public void deleteOne(Product entity) {
        _session.delete(entity);
    }

    @Override
    public void deleteAll() {
        //List<Costumer> entityList = getAll();
        for (Product entity : getAll()) {
            deleteOne(entity);
        }
    }

}
