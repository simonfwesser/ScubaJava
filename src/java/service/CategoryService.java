package service;

import dataAccess.CategoryDAO;
import entite.Category;
import entite.CategoryDetail;
import entite.Product;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

public class CategoryService {

    static List<Category> getAll() {
        CategoryDAO categoryDAO = new CategoryDAO();
        categoryDAO.openSession();
        List<Category> list = categoryDAO.getAll();
        categoryDAO.closeSession();
        return list;

    }


    static List<Product> getAllProducts(String categoryCode) {
        CategoryDAO categoryDAO = new CategoryDAO();
        categoryDAO.openSession();
        Category category = categoryDAO.getOne(categoryCode);
        categoryDAO.closeSession();
        return new ArrayList<Product>(category.getProducts());
    }


}
