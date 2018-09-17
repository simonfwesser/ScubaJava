package service;

import dataAccess.CustomerDAO;
import dataAccess.DAO;
import dataAccess.DbConnection;
import dataAccess.ProductDAO;
import entite.*;
import java.util.HashMap;
import java.util.List;

public class Service {

    private static Languages _language = null;

    public Service() {
    }

    ////////////////////////////////////////////////////////////
    public static void setLanguage(String languageCode) {
        _language = LanguageService.getOne(languageCode);
    }

    public static Languages getLanguage() {
        return _language;
    }

    ////////////////////////////////////////////////////////////
    public static List<Product> getAllProducts() {
        return ProductService.getAll();
    }

    public static Product getOneProduct(String id) {
        return ProductService.getOne(id);
    }

    public static void closeProductSession() {
        ProductService.closeSession();
    }

    ////////////////////////////////////////////////////////////
    public static Customer getOneCostumer(String id) {
        return CustomerService.getOne(id);
    }

    public static void closeCustomerSession() {
        CustomerService.closeSession();
    }

    ////////////////////////////////////////////////////////////
    public static List<Category> getAllCategories() {
//        return CategoryService.getAllCategories(_language);
        return CategoryService.getAll();
    }
    
    public static HashMap<Category, CategoryDetail> getAllCategoriesWithDetails(){
        HashMap<Category, CategoryDetail> hashMap = new HashMap();
        List<Category> categories = getAllCategories();
        //List<CategoryDetail> details = getAllCategoryDetails();
        for(Category category : categories){
            hashMap.put(new Category(), new CategoryDetail());
        }
        
        return null;
    }
    
    

    public static void closeCategorySession() {
        CategoryService.closeSession();
    }

    ////////////////////////////////////////////////////////////
    public static void openDbConnection() {
        DbConnection.getInstance();
    }

    public static void closeDbConnection() {
        DbConnection.getInstance().close();
    }

}
