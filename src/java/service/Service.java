package service;

import dataAccess.CustomerDAO;
import dataAccess.DAO;
import dataAccess.DbConnection;
import dataAccess.ProductDAO;
import entite.*;
import java.util.List;

public class Service {

    private static String _language = "";

    public Service() {
    }

    ////////////////////////////////////////////////////////////
    public static void setLanguage(String language) {
        _language = language;
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
    public static List<String> getAllCategories() {
        return null ;//CategoryService.getAllCategories(_language);
    }

    ////////////////////////////////////////////////////////////
    public static void openDbConnection() {
        DbConnection.getInstance();
    }

    public static void closeDbConnection() {
        DbConnection.getInstance().close();
    }

}
