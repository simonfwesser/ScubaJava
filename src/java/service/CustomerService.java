
package service;

import dataAccess.CustomerDAO;
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
    
    public static void add(Customer customer){
        CustomerDAO customerDAO = new CustomerDAO();
        customerDAO.openSession();
        customerDAO.beginTransaction();
        customerDAO.persist(customer);
        customerDAO.commitTransaction();
        customerDAO.closeSession();
    }
    
//    public static void closeSession(){
//        CustomerDAO CustomerDAO = new CustomerDAO();
//        CustomerDAO.closeSession();
//    }
    
}
