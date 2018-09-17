package entite;
// Generated 2018-09-17 14:03:04 by Hibernate Tools 4.3.1



/**
 * CategoryDetailId generated by hbm2java
 */
public class CategoryDetailId  implements java.io.Serializable {


     private String categoryCode;
     private String languageCode;

    public CategoryDetailId() {
    }

    public CategoryDetailId(String categoryCode, String languageCode) {
       this.categoryCode = categoryCode;
       this.languageCode = languageCode;
    }
   
    public String getCategoryCode() {
        return this.categoryCode;
    }
    
    public void setCategoryCode(String categoryCode) {
        this.categoryCode = categoryCode;
    }
    public String getLanguageCode() {
        return this.languageCode;
    }
    
    public void setLanguageCode(String languageCode) {
        this.languageCode = languageCode;
    }


   public boolean equals(Object other) {
         if ( (this == other ) ) return true;
		 if ( (other == null ) ) return false;
		 if ( !(other instanceof CategoryDetailId) ) return false;
		 CategoryDetailId castOther = ( CategoryDetailId ) other; 
         
		 return ( (this.getCategoryCode()==castOther.getCategoryCode()) || ( this.getCategoryCode()!=null && castOther.getCategoryCode()!=null && this.getCategoryCode().equals(castOther.getCategoryCode()) ) )
 && ( (this.getLanguageCode()==castOther.getLanguageCode()) || ( this.getLanguageCode()!=null && castOther.getLanguageCode()!=null && this.getLanguageCode().equals(castOther.getLanguageCode()) ) );
   }
   
   public int hashCode() {
         int result = 17;
         
         result = 37 * result + ( getCategoryCode() == null ? 0 : this.getCategoryCode().hashCode() );
         result = 37 * result + ( getLanguageCode() == null ? 0 : this.getLanguageCode().hashCode() );
         return result;
   }   


}


