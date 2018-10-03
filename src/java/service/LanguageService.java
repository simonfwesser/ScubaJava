package service;

import dataAccess.LanguageDAO;
import entite.Languages;
import java.util.List;

public class LanguageService {

    private static final String DEFAULT_LANGUAGE_CODE = "en";
//    private static final String DEFAULT_LANGUAGE_CODE = "fr";

    public static List<Languages> getAll() {
        LanguageDAO languageDAO = new LanguageDAO();
        languageDAO.openSession();
        List<Languages> list = languageDAO.getAll();
        languageDAO.closeSession();
        return list;
    }

    public static Languages getOne(String languageCode) {
        LanguageDAO languageDAO = new LanguageDAO();
        languageDAO.openSession();
        Languages language = null;
        if (languageCode != null) {
            language = languageDAO.getOne(languageCode);
        }
        else {
            language = languageDAO.getOne(DEFAULT_LANGUAGE_CODE);
        }
        languageDAO.closeSession();
        return language;
    }

//    public static void closeSession() {
//        LanguageDAO languageDAO = new LanguageDAO();
//        languageDAO.closeSession();
//    }

}
