package service;

import dataAccess.CostumerDAO;
import dataAccess.DAO;
import dataAccess.DbConnection;
import dataAccess.ProductDAO;
import entite.*;
import java.util.List;


public class Service {

    public Service() {
    }

    ////////////////////////////////////////////////////////////
    public static List<Product> getAllProducts() {
        return ProductService.getAll();
    }

    public static Product getOneProduct(String id) {
        return ProductService.getOne(id);
    }
    
    public static void closeProductSession(){
        ProductService.closeSession();
    };
    
    ////////////////////////////////////////////////////////////
    
    public static Costumer getOneCostumer(String id){
        return CostumerService.getOne(id);
    }
    
    public static void closeCostumerSession(){
        CostumerService.closeSession();
    };
    
    ////////////////////////////////////////////////////////////
    
    public static void openDbConnection(){
        DbConnection.getInstance();
    }
    
    
    public static void closeDbConnection(){
        DbConnection.getInstance().close();
    }
    


}
