package dataAccess;

import entite.Product;
import java.math.BigDecimal;
import java.util.List;

public class ProductDAO extends DAO<Product, BigDecimal> {

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
    }

    @Override
    public Product getOne(BigDecimal primaryKey) {
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
