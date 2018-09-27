
import dataAccess.CustomerDAO;
import dataAccess.DAO;
import dataAccess.DbConnection;
import entite.Customer;
import java.util.ArrayList;
import java.util.List;

public class Main {

    public static void main(String[] args) {
        
        DbConnection.getInstance();

        //add(1);
        show();

        DbConnection.getInstance().close();

    }

    public static void show() {
        CustomerDAO dao = new CustomerDAO();
        dao.openSession();
        ArrayList<Customer> list = (ArrayList) dao.getAll();
        for (Customer c : list) {
            System.out.println(c.getEmail() + "  " + c.getPassword());
        }
        dao.closeSession();
    }

    public static void add(int number) {
        // https://stackoverflow.com/questions/7489805/jdbc-doesnt-store-update-in-sqlite-database
        CustomerDAO dao = new CustomerDAO();
        dao.openSession();
        Customer customer = new Customer(
                "email_" +number, "firstname_"+number, "lastname_"+number, "address_"+number, "password_"+number
        );
        number++;
        dao.beginTransaction();
        dao.persist(customer);
        try {
            dao.commitTransaction();

        }
        catch (Exception e) {
            System.out.println("*********EXCEPTION*****************");
            System.out.println(e.getMessage());
        }
        System.out.println("dao.wasCommited() ? --> " + dao.wasCommited());
        dao.closeSession();

    }

}
