
package service;

import dataAccess.CostumerDAO;
import dataAccess.DAO;
import entite.Costumer;
import java.util.List;

public class CostumerService {
    
    
    public static Costumer getOne(String id){
        CostumerDAO costumerDAO = new CostumerDAO();
        costumerDAO.openSession();
        Costumer costumer = costumerDAO.getOne(id);
        //costumerDAO.closeSession();
        return costumer;
    }

    public static List<Costumer> getAll(){
        CostumerDAO costumerDAO = new CostumerDAO();
        costumerDAO.openSession();
        List<Costumer> costumers = costumerDAO.getAll();
        //costumerDAO.closeSession();
        return costumers;
    }
    
    public static void closeSession(){
        CostumerDAO costumerDAO = new CostumerDAO();
        costumerDAO.closeSession();
    }
    
}
