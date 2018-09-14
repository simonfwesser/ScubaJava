package service;

import dataAccess.*;
import entite.Detail;
import entite.Product;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class ProductService {

    public static List<Product> getAll() {
        ProductDAO productDAO = new ProductDAO();
        productDAO.openSession();
        List<Product> list = productDAO.getAll();
        //productDAO.closeSession();
        return list;
    }

    public static Product getOne(String id) {
        ProductDAO productDAO = new ProductDAO();
        productDAO.openSession();
        Product product = productDAO.getOne(new BigDecimal(Integer.parseInt(id)));
        //productDAO.closeSession();
        return product;
    }

    public static List<String> getAllTypes(String language) {
        List<Product> products = ProductService.getAll();
        Set<String> types = new HashSet();
        
        for(Product product : products){
            List<Detail> details = new ArrayList(product.getDetails()); 
            for(Detail detail : details){
                if(language.toLowerCase().equals(detail.getLanguage().getLanguageCode().toLowerCase())){
                    types.add(detail.getType());
                }   
            }
        }
        return new ArrayList(types);
    }

    public static void closeSession() {
        DAO productDAO = new ProductDAO();
        productDAO.closeSession();
    }

}
