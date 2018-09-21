package service;

import dataAccess.DbConnection;
import entite.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

public class Service {

    private static Languages _language = null;

    public static List<Product> getProductsByName(String entredString) {
        List<Product> productsByName = null;
//        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
        return productsByName;
    }

    public Service() {
    }

    ////////////////////////////////////////////////////////////
    public static void setLanguage(String languageCode) {
        _language = LanguageService.getOne(languageCode);
    }

    public static Languages getLanguage() {
        return _language;
    }

    public static Object getAllLanguages() {
        return LanguageService.getAll();
    }

    ////////////////////////////////////////////////////////////
    public static List<Product> getAllProducts() {
        return ProductService.getAll();
    }

    public static Product getOneProduct(String id) {
        Product product = ProductService.getOne(id);
        return product;
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

    public static List<CategoryDetail> getAllCategoryDetails() {
        List<Category> categories = getAllCategories();
        List<CategoryDetail> categoryDetails = new ArrayList();

        for (Category category : categories) {
            for (CategoryDetail cd : (Set<CategoryDetail>) category.getCategoryDetails()) {
                if ((_language.getLanguageCode()).equals((cd.getLanguages().getLanguageCode()))) {
                    categoryDetails.add(cd);
                }
            }
        }
        return categoryDetails;
    }

    public static CategoryDetail getOneCategoryDetail(String categoryCode) {
        CategoryDetail categoryDetail = null;
        List<CategoryDetail> categoryDetails = getAllCategoryDetails();
        for (CategoryDetail cd : categoryDetails) {
            if (categoryCode.equals(cd.getCategory().getCategoryCode())) {
                categoryDetail = cd;
            }
        }
        return categoryDetail;
    }

    public static List<Product> getAllCategoryProducts(String categoryCode) {
        List<Product> categoryProducts = null;
        categoryProducts = CategoryService.getAllProducts(categoryCode);
        return categoryProducts;
    }

    /////////////////////////////////////////////////////////////
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
