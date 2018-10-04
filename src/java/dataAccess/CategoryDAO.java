
package dataAccess;

import entite.Category;
import java.util.List;

/*
A11 - Programmation d'applications WEB
Projet de session.
Etudiants: 
- GHODBANE, Mohammed El Amine (1895101)
- TOULIATOS, Alexander (9736109)
*/

public class CategoryDAO extends DAO<Category, String>  {
    
    public CategoryDAO(){
        super();
    }

    @Override
    public void persist(Category entity) {
        _session.save(entity);
    }

    @Override
    public void update(Category entity) {
        _session.update(entity);
    }

    @Override
    public Category getOne(String primaryKey) {
        return (Category) _session.get(Category.class, primaryKey);
    }

    @Override
    public List<Category> getAll() {
        return (List<Category>) _session.createQuery("from Category").list();
    }

    @Override
    public void deleteOne(Category entity) {
        _session.delete(entity);
    }

    @Override
    public void deleteAll() {
        for (Category entity : getAll()) {
            deleteOne(entity);
        }
    }
    
}
