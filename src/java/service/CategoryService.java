package service;

import dataAccess.CategoryDAO;
import entite.Category;
import entite.CategoryDetail;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

public class CategoryService {

    static List<Category> getAll() {
        //List<String> categoryNames = new ArrayList();
        CategoryDAO categoryDAO = new CategoryDAO();
        categoryDAO.openSession();
        List<Category> list = categoryDAO.getAll();
        //productDAO.closeSession();
        return list;

//        List<Category> categories = categoryDAO.getAll();
//        Set<CategoryDetail> details = null;
//        for (Category category : categories) {
//            details = category.getCategoryDetails();
//            for (CategoryDetail detail : details){
//                if ((language.toUpperCase()).equals(detail.getLanguages().getLanguageCode().toUpperCase())){
//                    categoryNames.add(detail.getCategoryName());
//                }
//            }
//        }
//
//        return categoryNames;
    }

    public static void closeSession() {
        CategoryDAO categoryDAO = new CategoryDAO();
        categoryDAO.closeSession();
    }
}
