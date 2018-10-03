package service;

import dataAccess.DbConnection;
import entite.*;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import modele.ShoppingCart;

public class Service {

    private static Languages _language = null;

    public static List<Product> getProductsByName(String entredString) {
        List<Product> productsByName = null;
        return productsByName;
    }

    public Service() {
    }

    ////////////////////////////////////////////////////////////
    public static void setServiceLanguage(String languageCode) {
        _language = LanguageService.getOne(languageCode);
    }

    public static Languages getServiceLanguage() {
        return _language;
    }

    public static List<Languages> getAllLanguages() {
        return LanguageService.getAll();
    }

    ////////////////////////////////////////////////////////////
    public static List<Product> getAllProducts() {
        return ProductService.getAll();
    }

    public static Product getOneProduct(String id) {
        Product product = ProductService.getOne(id);
        Set<ProductDetail> productDetails = new HashSet();
        for(ProductDetail detail : (Set<ProductDetail>)product.getProductDetails()){
            if ((_language.getLanguageCode()).equals((detail.getLanguages().getLanguageCode()))) {
                    productDetails.add(detail);
                }
        }
        product.setProductDetails(productDetails);
        return product;
    }

    ////////////////////////////////////////////////////////////
    public static Customer getOneCustomer(String id) {
        return CustomerService.getOne(id);
    }

    public static void addCustomer(Customer customer) throws Exception {
        CustomerService.add(customer);
    }

    ////////////////////////////////////////////////////////////
    public static List<Category> getAllCategories() {
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
    public static void savePlacedOrder(ShoppingCart shoppingCart) {
        PlacedOrderService.save(shoppingCart);

    }

    ////////////////////////////////////////////////////////////
    public static void openDbConnection() throws ExceptionInInitializerError {
        DbConnection.getInstance();
    }

    public static void closeDbConnection() {
        DbConnection.getInstance().close();
    }

}
