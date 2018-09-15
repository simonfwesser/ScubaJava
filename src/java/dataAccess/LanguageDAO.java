package dataAccess;

import entite.Languages;
import java.util.List;

public class LanguageDAO extends DAO<Languages, String> {

    public LanguageDAO() {
        super();
    }

    @Override
    public void persist(Languages entity) {
        _session.save(entity);
    }

    @Override
    public void update(Languages entity) {
        _session.update(entity);
    }

    @Override
    public Languages getOne(String primaryKey) {
        return (Languages) _session.get(Languages.class, primaryKey);
    }

    @Override
    public List<Languages> getAll() {
        return (List<Languages>) _session.createQuery("from Languages").list();
    }

    @Override
    public void deleteOne(Languages entity) {
        _session.delete(entity);
    }

    @Override
    public void deleteAll() {
        for (Languages entity : getAll()) {
            deleteOne(entity);
        }
    }

}
