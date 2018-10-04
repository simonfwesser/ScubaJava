
package dataAccess;

import entite.CategoryDetail;
import entite.CategoryDetailId;
import java.util.List;

/*
A11 - Programmation d'applications WEB
Projet de session.
Etudiants: 
- GHODBANE, Mohammed El Amine (1895101)
- TOULIATOS, Alexander (9736109)
*/

public class CategoryDetailDAO extends DAO<CategoryDetail, CategoryDetailId> {

    public CategoryDetailDAO() {
        super();
    }
    
    @Override
    public void persist(CategoryDetail entity) {
        _session.save(entity);
    }

    @Override
    public void update(CategoryDetail entity) {
        _session.update(entity);
    }

    @Override
    public CategoryDetail getOne(CategoryDetailId primaryKey) {
        return (CategoryDetail) _session.get(CategoryDetail.class, primaryKey);
    }

    @Override
    public List<CategoryDetail> getAll() {
        return (List<CategoryDetail>) _session.createQuery("from CategoryDetail").list();
    }

    @Override
    public void deleteOne(CategoryDetail entity) {
        _session.delete(entity);
    }

    @Override
    public void deleteAll() {
        for (CategoryDetail entity : getAll()) {
            deleteOne(entity);
        }
    }
    
}
