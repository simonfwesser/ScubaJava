
package service;

import dataAccess.*;
import entite.Product;
import java.math.BigDecimal;
import java.util.List;

public class ProductService {
         
    public static List<Product> getAll() {
        ProductDAO productDAO = new ProductDAO();
        productDAO.openSession();
        List<Product> list = productDAO.getAll();
        //productDAO.closeSession();
        return list;
    }
    
    public static Product getOne(String id){
        ProductDAO productDAO = new ProductDAO();
        productDAO.openSession();
        Product product = productDAO.getOne(new BigDecimal(Integer.parseInt(id)));
        //productDAO.closeSession();
        return product;
    }
    
    public static void closeSession(){
        DAO productDAO = new ProductDAO();
        productDAO.closeSession();
    }

    
    
}
