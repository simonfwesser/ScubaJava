package entite;
// Generated 2018-09-14 12:07:09 by Hibernate Tools 4.3.1



/**
 * Administrator generated by hbm2java
 */
public class Administrator  implements java.io.Serializable {


     private String adminCode;
     private String firstName;
     private String lastName;
     private String password;

    public Administrator() {
    }

    public Administrator(String adminCode, String firstName, String lastName, String password) {
       this.adminCode = adminCode;
       this.firstName = firstName;
       this.lastName = lastName;
       this.password = password;
    }
   
    public String getAdminCode() {
        return this.adminCode;
    }
    
    public void setAdminCode(String adminCode) {
        this.adminCode = adminCode;
    }
    public String getFirstName() {
        return this.firstName;
    }
    
    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }
    public String getLastName() {
        return this.lastName;
    }
    
    public void setLastName(String lastName) {
        this.lastName = lastName;
    }
    public String getPassword() {
        return this.password;
    }
    
    public void setPassword(String password) {
        this.password = password;
    }




}


