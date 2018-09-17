package service;

import dataAccess.*;
import entite.Product;
import entite.ProductDetail;
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
        Product product = productDAO.getOne(Integer.valueOf(id));
        //productDAO.closeSession();
        return product;
    }


    public static void closeSession() {
        ProductDAO productDAO = new ProductDAO();
        productDAO.closeSession();
    }

}
