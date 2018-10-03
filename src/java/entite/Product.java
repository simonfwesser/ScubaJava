package entite;
// Generated 2018-09-17 14:03:04 by Hibernate Tools 4.3.1

import java.util.HashSet;
import java.util.List;
import java.util.Objects;
import java.util.Set;

/**
 * Product generated by hbm2java
 */
public class Product implements java.io.Serializable {

    private Integer sku;
    private Category category;
    private String name;
    private String brand;
    private double price;
    private int quantity;
    private String image;
    private Set productDetails = new HashSet(0);
    private Set orderLines = new HashSet(0);

    public Product() {
    }

    @Override
    public boolean equals(Object o) {
        boolean isEqual = false;
        if (o.getClass() != Product.class) {
            isEqual = false;
        }
        else if (this.sku.intValue() == ((Product) o).getSku().intValue()) {
            isEqual = true;
        }
        else {
            isEqual = false;
        }
        return isEqual;
    }

    @Override
    public int hashCode() {
        return this.sku.intValue();
    }

    public Product(Integer sku, Category category, String name, String brand, double price, int quantity, String image) {
        this.sku = sku;
        this.category = category;
        this.name = name;
        this.brand = brand;
        this.price = price;
        this.quantity = quantity;
        this.image = image;
    }

    public Product(Integer sku, Category category, String name, String brand, double price, int quantity, String image, Set productDetails, Set orderLines) {
        this.sku = sku;
        this.category = category;
        this.name = name;
        this.brand = brand;
        this.price = price;
        this.quantity = quantity;
        this.image = image;
        this.productDetails = productDetails;
        this.orderLines = orderLines;
    }

    public Integer getSku() {
        return this.sku;
    }

    public void setSku(Integer sku) {
        this.sku = sku;
    }

    public Category getCategory() {
        return this.category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public String getName() {
        return this.name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getBrand() {
        return this.brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public double getPrice() {
        return this.price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQuantity() {
        return this.quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getImage() {
        return this.image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public Set getProductDetails() {
        return this.productDetails;
    }

    public void setProductDetails(Set productDetails) {
        this.productDetails = productDetails;
    }

    public Set getOrderLines() {
        return this.orderLines;
    }

    public void setOrderLines(Set orderLines) {
        this.orderLines = orderLines;
    }

    public String toJSON() {
        String jsonString = "";
        jsonString += "{";
        jsonString += "\"name\"" + " : " + "\"" + this.getName() + "\"";
        jsonString += " , ";
        jsonString += "\"sku\"" + " : " + "\"" + this.getSku() + "\"";
        jsonString += "}";
        return jsonString;
    }
    
    public static String toJSON(List<Product> products){
        String jsonString = "";
        int nProducts = products.size();
        jsonString += "[";
        for (int i = 0; i < nProducts; i++) {
            jsonString += products.get(i).toJSON();
            jsonString += (i != nProducts - 1 ? "," : "");
        }
        jsonString += "]";
        return jsonString;
    }

}
