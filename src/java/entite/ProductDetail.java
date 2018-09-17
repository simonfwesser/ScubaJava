package entite;
// Generated 2018-09-14 20:08:41 by Hibernate Tools 4.3.1



/**
 * ProductDetail generated by hbm2java
 */
public class ProductDetail  implements java.io.Serializable {


     private ProductDetailId id;
     private Languages languages;
     private Product product;
     private String keyFeatures;
     private String about;
     private String features;

    public ProductDetail() {
    }

	
    public ProductDetail(ProductDetailId id, Languages languages, Product product) {
        this.id = id;
        this.languages = languages;
        this.product = product;
    }
    public ProductDetail(ProductDetailId id, Languages languages, Product product, String keyFeatures, String about, String features) {
       this.id = id;
       this.languages = languages;
       this.product = product;
       this.keyFeatures = keyFeatures;
       this.about = about;
       this.features = features;
    }
   
    public ProductDetailId getId() {
        return this.id;
    }
    
    public void setId(ProductDetailId id) {
        this.id = id;
    }
    public Languages getLanguages() {
        return this.languages;
    }
    
    public void setLanguages(Languages languages) {
        this.languages = languages;
    }
    public Product getProduct() {
        return this.product;
    }
    
    public void setProduct(Product product) {
        this.product = product;
    }
    public String getKeyFeatures() {
        return this.keyFeatures;
    }
    
    public void setKeyFeatures(String keyFeatures) {
        this.keyFeatures = keyFeatures;
    }
    public String getAbout() {
        return this.about;
    }
    
    public void setAbout(String about) {
        this.about = about;
    }
    public String getFeatures() {
        return this.features;
    }
    
    public void setFeatures(String features) {
        this.features = features;
    }




}

