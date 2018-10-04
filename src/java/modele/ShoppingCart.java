package modele;

import entite.Product;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

/*
A11 - Programmation d'applications WEB
Projet de session.
Etudiants: 
- GHODBANE, Mohammed El Amine (1895101)
- TOULIATOS, Alexander (9736109)
*/

public class ShoppingCart {

    public static final double TAUX_TPS = 0.05;
    public static final double TAUX_TVQ = 0.09975;

    private HashMap<Product, Integer> _contents = null;

    public ShoppingCart() {
        _contents = new HashMap();
    }

    public boolean isEmpty() {
        boolean isEmpty = true;
        if (_contents != null) {
            isEmpty = _contents.isEmpty();
        }
        else {
            isEmpty = true;
        }
        return isEmpty;
    }

    public boolean contains(Product product) {
        boolean contains = false;
        contains = _contents.containsKey(product);
        return contains;
    }

    public int getQuantity(Product product) {
        int quantity = 0;
        quantity = _contents.get(product);
        return quantity;
    }

    public double getSum(Product product) {
        double sum = 0.0;
        sum = product.getPrice() * getQuantity(product);
        return sum;
    }

    public int getQuantity() {
        int quantity = 0;
        Iterator it = _contents.entrySet().iterator();
        while (it.hasNext()) {
            Map.Entry pair = (Map.Entry) it.next();
            quantity += getQuantity((Product) pair.getKey());
        }
        return quantity;
    }

    public double getSum() {
        double sum = 0.0;
        Iterator it = _contents.entrySet().iterator();
        while (it.hasNext()) {
            Map.Entry pair = (Map.Entry) it.next();
            sum += getSum((Product) pair.getKey());
        }
        return sum;
    }

    public String getGstTaxes() {
        double sum = getSum();
        return formatAmountToCent(sum * TAUX_TPS);
    }

    public String getQstTaxes() {
        double sum = getSum();
        return formatAmountToCent(sum * TAUX_TVQ);
    }

    public double getTotalSum() {
        double totalSum = 0.0;
        totalSum = getSum();
        totalSum += totalSum * TAUX_TPS;
        totalSum += totalSum * TAUX_TVQ;
        return totalSum;
    }

    public String getTotalWrittenSum() {
        return formatAmountToCent(getTotalSum());
    }

    public static double roundAmountToCent(double amount) {
        String writtenAmount = formatAmountToCent(amount);
        return Double.parseDouble(writtenAmount);
    }

    public static String formatAmountToCent(double amount) {
        amount += 0.005;
        String writtenAmount = new Double(amount).toString();
        int decimalPosition = writtenAmount.indexOf('.');
        writtenAmount = writtenAmount.substring(0, decimalPosition + 3);
        return writtenAmount;
    }

    ///////////////////////////////////////////////////////////
    public void put(Product product, int quantity) {
        _contents.put(product, quantity);

    }

    public void remove(Product product) {
        _contents.remove(product);
    }

    public HashMap<Product, Integer> getContents() {
        return _contents;
    }

}
