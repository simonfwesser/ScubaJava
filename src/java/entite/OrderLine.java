package entite;
// Generated 2018-09-17 14:03:04 by Hibernate Tools 4.3.1



/**
 * OrderLine generated by hbm2java
 */
public class OrderLine  implements java.io.Serializable {


     private OrderLineId id;
     private PlacedOrder placedOrder;
     private Product product;
     private int quantity;
     private double prix;

    public OrderLine() {
    }

	
    public OrderLine(OrderLineId id, int quantity, double prix) {
        this.id = id;
        this.quantity = quantity;
        this.prix = prix;
    }
    public OrderLine(OrderLineId id, PlacedOrder placedOrder, Product product, int quantity, double prix) {
       this.id = id;
       this.placedOrder = placedOrder;
       this.product = product;
       this.quantity = quantity;
       this.prix = prix;
    }
   
    public OrderLineId getId() {
        return this.id;
    }
    
    public void setId(OrderLineId id) {
        this.id = id;
    }
    public PlacedOrder getPlacedOrder() {
        return this.placedOrder;
    }
    
    public void setPlacedOrder(PlacedOrder placedOrder) {
        this.placedOrder = placedOrder;
    }
    public Product getProduct() {
        return this.product;
    }
    
    public void setProduct(Product product) {
        this.product = product;
    }
    public int getQuantity() {
        return this.quantity;
    }
    
    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
    public double getPrix() {
        return this.prix;
    }
    
    public void setPrix(double prix) {
        this.prix = prix;
    }




}


