package entite;
// Generated 2018-09-17 14:03:04 by Hibernate Tools 4.3.1



/**
 * OrderLineId generated by hbm2java
 */
public class OrderLineId  implements java.io.Serializable {


     private Integer sku;
     private String orderNumber;

    public OrderLineId() {
    }

    public OrderLineId(Integer sku, String orderNumber) {
       this.sku = sku;
       this.orderNumber = orderNumber;
    }
   
    public Integer getSku() {
        return this.sku;
    }
    
    public void setSku(Integer sku) {
        this.sku = sku;
    }
    public String getOrderNumber() {
        return this.orderNumber;
    }
    
    public void setOrderNumber(String orderNumber) {
        this.orderNumber = orderNumber;
    }


   public boolean equals(Object other) {
         if ( (this == other ) ) return true;
		 if ( (other == null ) ) return false;
		 if ( !(other instanceof OrderLineId) ) return false;
		 OrderLineId castOther = ( OrderLineId ) other; 
         
		 return ( (this.getSku()==castOther.getSku()) || ( this.getSku()!=null && castOther.getSku()!=null && this.getSku().equals(castOther.getSku()) ) )
 && ( (this.getOrderNumber()==castOther.getOrderNumber()) || ( this.getOrderNumber()!=null && castOther.getOrderNumber()!=null && this.getOrderNumber().equals(castOther.getOrderNumber()) ) );
   }
   
   public int hashCode() {
         int result = 17;
         
         result = 37 * result + ( getSku() == null ? 0 : this.getSku().hashCode() );
         result = 37 * result + ( getOrderNumber() == null ? 0 : this.getOrderNumber().hashCode() );
         return result;
   }   


}


