package zzz;

import zzz.LanguageDAO;
import entite.Languages;
import java.util.List;


public class LanguageService {

    private static LanguageDAO languageDAO;

    public LanguageService() {
        languageDAO = new LanguageDAO();
    }

    public void persist(Languages entity) {
        languageDAO.openCurrentSessionWithTransaction();
        languageDAO.persist(entity);
        languageDAO.closeCurrentSessionWithTransaction();
    }

    public void update(Languages entity) {
        languageDAO.openCurrentSessionWithTransaction();
        languageDAO.update(entity);
        languageDAO.closeCurrentSessionWithTransaction();
    }

    public Languages findById(String id) {
        languageDAO.openCurrentSession();
        Languages language = languageDAO.findById(id);
        languageDAO.closeCurrentSession();
        return language;
    }

    public void delete(String id) {
        languageDAO.openCurrentSessionWithTransaction();
        Languages language = languageDAO.findById(id);
        languageDAO.delete(language);
        languageDAO.closeCurrentSessionWithTransaction();
    }

    public void delete(Languages language) {
        languageDAO.openCurrentSessionWithTransaction();
        languageDAO.delete(language);
        languageDAO.closeCurrentSessionWithTransaction();
    }

    public List<Languages> findAll() {
        languageDAO.openCurrentSession();
        List<Languages> languages = languageDAO.findAll();
        languageDAO.closeCurrentSession();
        return languages;
    }

    public void deleteAll() {
        languageDAO.openCurrentSessionWithTransaction();
        languageDAO.deleteAll();
        languageDAO.closeCurrentSessionWithTransaction();
    }

    public LanguageDAO languageDAO() {
        return languageDAO;
    }
}
