
package service;

import dataAccess.CustomerDAO;
import dataAccess.DAO;
import entite.Customer;
import java.util.List;

public class CustomerService {
    
    
    public static Customer getOne(String id){
        CustomerDAO CustomerDAO = new CustomerDAO();
        CustomerDAO.openSession();
        Customer Customer = CustomerDAO.getOne(id);
        //CustomerDAO.closeSession();
        return Customer;
    }

    public static List<Customer> getAll(){
        CustomerDAO CustomerDAO = new CustomerDAO();
        CustomerDAO.openSession();
        List<Customer> Customers = CustomerDAO.getAll();
        //CustomerDAO.closeSession();
        return Customers;
    }
    
    public static void closeSession(){
        CustomerDAO CustomerDAO = new CustomerDAO();
        CustomerDAO.closeSession();
    }
    
}
