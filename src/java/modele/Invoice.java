package modele;

import dataAccess.PlacedOrderDAO;
import entite.Customer;
import entite.OrderLine;
import entite.OrderLineId;
import entite.PlacedOrder;
import entite.Product;
import java.time.LocalDateTime;
import java.util.HashSet;
import java.util.Set;
import org.hibernate.exception.ConstraintViolationException;
import org.hibernate.exception.LockAcquisitionException;
import resource.Page;
import service.ProductService;

public class Invoice {

    public static void saveOrderInDatabse(Customer customer, ShoppingCart shoppingCart)
            throws LockAcquisitionException, ConstraintViolationException {

        String orderNumber = Invoice.generateOrderNumber();

        PlacedOrder placedOrder = new PlacedOrder(orderNumber, customer);

        Set<OrderLine> orderLines = new HashSet(0);

        for (Product product : shoppingCart.getContents().keySet()) {
            product.setQuantity(ProductService.getOne(product.getSku().toString()).getQuantity() - shoppingCart.getQuantity(product));

            ProductService.updateOne(product);
            orderLines.add(new OrderLine(
                    new OrderLineId(product.getSku(), orderNumber),
                    placedOrder,
                    product,
                    shoppingCart.getQuantity(product),
                    shoppingCart.getSum(product)
            ));
        }
        placedOrder.setOrderLines(orderLines);

        PlacedOrderDAO placedOrderDAO = new PlacedOrderDAO();
        placedOrderDAO.openSession();
        

        try {
            // https://www.codejava.net/frameworks/hibernate/hibernate-one-to-many-xml-mapping-example
            placedOrderDAO.beginTransaction();
            placedOrderDAO.persist(placedOrder);
            placedOrderDAO.commitTransaction();
        }
        catch (LockAcquisitionException lae) {
            throw lae;
        }
        catch (ConstraintViolationException cve) {
            throw cve;
        }
        finally {
            placedOrderDAO.closeSession();
        }

    }

    private static String generateOrderNumber() {
        LocalDateTime now = LocalDateTime.now();
        int year = now.getYear();
        int month = now.getMonthValue();
        int day = now.getDayOfMonth();
        int hour = now.getHour();
        int minute = now.getMinute();
        int second = now.getSecond();

        String orderNumber = "";
        orderNumber += day;
        orderNumber += hour;
        orderNumber += minute;
        orderNumber += second;

        return orderNumber;

    }

}
