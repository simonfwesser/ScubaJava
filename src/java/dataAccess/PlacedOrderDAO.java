package dataAccess;

import entite.PlacedOrder;
import java.util.List;

/*
A11 - Programmation d'applications WEB
Projet de session.
Etudiants: 
- GHODBANE, Mohammed El Amine (1895101)
- TOULIATOS, Alexander (9736109)
*/

public class PlacedOrderDAO extends DAO<PlacedOrder, String> {

    public PlacedOrderDAO() {
        super();
    }

    @Override
    public void persist(PlacedOrder entity) {
        _session.persist(entity);
        _session.flush();
    }

    @Override
    public void update(PlacedOrder entity) {
        _session.update(entity);
    }

    @Override
    public PlacedOrder getOne(String primaryKey) {
        return (PlacedOrder) _session.get(PlacedOrder.class, primaryKey);
    }

    @Override
    public List<PlacedOrder> getAll() {
        return (List<PlacedOrder>) _session.createQuery("from PlacedOrder").list();
    }

    @Override
    public void deleteOne(PlacedOrder entity) {
        _session.delete(entity);
    }

    @Override
    public void deleteAll() {
        for (PlacedOrder entity : getAll()) {
            deleteOne(entity);
        }
    }

}
