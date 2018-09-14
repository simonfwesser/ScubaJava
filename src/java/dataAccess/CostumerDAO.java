package dataAccess;

import entite.Costumer;
import java.util.List;


public class CostumerDAO extends DAO<Costumer, String> {

    public CostumerDAO() {
        super();
    }

    @Override
    public void persist(Costumer entity) {
        _session.save(entity);
    }

    @Override
    public void update(Costumer entity) {
        _session.update(entity);
    }

    @Override
    public Costumer getOne(String primaryKey) {
        return (Costumer) _session.get(Costumer.class, primaryKey);
    }

    @Override
    public List<Costumer> getAll() {
        return (List<Costumer>) _session.createQuery("from Costumer").list();
    }

    @Override
    public void deleteOne(Costumer entity) {
        _session.delete(entity);
    }

    @Override
    public void deleteAll() {
        //List<Costumer> entityList = getAll();
        for (Costumer entity : getAll()) {
            deleteOne(entity);
        }
    }

}
