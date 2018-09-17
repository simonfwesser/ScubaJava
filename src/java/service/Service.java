package service;

import dataAccess.CustomerDAO;
import dataAccess.DAO;
import dataAccess.DbConnection;
import dataAccess.ProductDAO;
import entite.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Set;

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
    
    public static List<CategoryDetail> getAllCategoryDetails(){
        List<Category> categories = getAllCategories();
        List<CategoryDetail> categoryDetails = new ArrayList();

        for(Category category : categories){
            for(CategoryDetail cd : (Set<CategoryDetail>)category.getCategoryDetails() ){
                if ((_language.getLanguageCode()).equals( (cd.getLanguages().getLanguageCode()))){
                    categoryDetails.add(cd);
                }
            }    
        }
        return categoryDetails;
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
