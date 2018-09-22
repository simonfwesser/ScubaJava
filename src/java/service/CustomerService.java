
package service;

import dataAccess.CustomerDAO;
import dataAccess.DAO;
import entite.Customer;
import java.util.List;

public class CustomerService {
    
    
    public static Customer getOne(String id){
        CustomerDAO customerDAO = new CustomerDAO();
        customerDAO.openSession();
        Customer customer = customerDAO.getOne(id);
        customerDAO.closeSession();
        return customer;
    }

    public static List<Customer> getAll(){
        CustomerDAO customerDAO = new CustomerDAO();
        customerDAO.openSession();
        List<Customer> customers = customerDAO.getAll();
        customerDAO.closeSession();
        return customers;
    }
    
//    public static void closeSession(){
//        CustomerDAO CustomerDAO = new CustomerDAO();
//        CustomerDAO.closeSession();
//    }
    
}
