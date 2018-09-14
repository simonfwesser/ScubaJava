
import dataAccess.CustomerDAO;
import dataAccess.DAO;
import dataAccess.DbConnection;
import entite.Costumer;
import java.util.List;


public class Main {
    
    public static void main(String[] args){
    
        //DataAccess.getInstance().open();
        DAO costumerDAO = new CustomerDAO(DbConnection.getInstance().getSessionFactory());
        
        List<Costumer> costumers = costumerDAO.getAll();
        
        costumerDAO.closeSession();
        
        for(Costumer costumer : costumers){
            System.out.println(costumer.getFirstName() +" " +costumer.getLastName());
        }

        DbConnection.getInstance().close();

        
    }
    
}
