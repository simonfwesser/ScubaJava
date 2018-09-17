package entite;
// Generated 2018-09-14 20:08:41 by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * Category generated by hbm2java
 */
public class Category  implements java.io.Serializable {


     private String categoryCode;
     private String categoryImage;
     private Set categoryDetails = new HashSet(0);
     private Set products = new HashSet(0);

    public Category() {
    }

	
    public Category(String categoryCode, String categoryImage) {
        this.categoryCode = categoryCode;
        this.categoryImage = categoryImage;
    }
    public Category(String categoryCode, String categoryImage, Set categoryDetails, Set products) {
       this.categoryCode = categoryCode;
       this.categoryImage = categoryImage;
       this.categoryDetails = categoryDetails;
       this.products = products;
    }
   
    public String getCategoryCode() {
        return this.categoryCode;
    }
    
    public void setCategoryCode(String categoryCode) {
        this.categoryCode = categoryCode;
    }
    public String getCategoryImage() {
        return this.categoryImage;
    }
    
    public void setCategoryImage(String categoryImage) {
        this.categoryImage = categoryImage;
    }
    public Set getCategoryDetails() {
        return this.categoryDetails;
    }
    
    public void setCategoryDetails(Set categoryDetails) {
        this.categoryDetails = categoryDetails;
    }
    public Set getProducts() {
        return this.products;
    }
    
    public void setProducts(Set products) {
        this.products = products;
    }




}

