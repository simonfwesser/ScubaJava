package service;

import dataAccess.CustomerDAO;
import entite.Customer;
import java.util.List;
import org.hibernate.exception.ConstraintViolationException;
import org.hibernate.exception.LockAcquisitionException;

public class CustomerService {

    public static Customer getOne(String id) {
        CustomerDAO customerDAO = new CustomerDAO();
        customerDAO.openSession();
        Customer customer = customerDAO.getOne(id);
        customerDAO.closeSession();
        return customer;
    }

    public static List<Customer> getAll() {
        CustomerDAO customerDAO = new CustomerDAO();
        customerDAO.openSession();
        List<Customer> customers = customerDAO.getAll();
        customerDAO.closeSession();
        return customers;
    }

    public static void add(Customer customer) throws Exception {

        CustomerDAO customerDAO = new CustomerDAO();
        customerDAO.openSession();
        try {
            customerDAO.beginTransaction();
            customerDAO.persist(customer);
            customerDAO.commitTransaction();
        }
        catch (LockAcquisitionException lae) {
            throw new Exception("Error! LockAcquisitionException.");
        }
        catch (ConstraintViolationException cve) {
            throw new Exception("Error! ConstraintViolationException.");
        }
        finally {
            customerDAO.closeSession();
        }

    }

//    public static void closeSession(){
//        CustomerDAO CustomerDAO = new CustomerDAO();
//        CustomerDAO.closeSession();
//    }
}
