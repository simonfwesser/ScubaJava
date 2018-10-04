<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib  prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page errorPage="WEB-INF/error.jsp" %>
<%@ page pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
    <head>
        <title>invoice.jsp</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="style/style.css" rel="stylesheet" type="text/css"/>

    </head>
    <body>

        <%@include file="header.jspf" %>

        <h1><fmt:message key="invoice.invoice" /></h1>

        <table border="1">
            <thead>
                <tr>
                    <th><fmt:message key="invoice.product" /></th>
                    <th><fmt:message key="invoice.price" /></th>
                    <th><fmt:message key="invoice.quantity" /></th>
                </tr>
            </thead>
            <tbody>

                <c:forEach var="item" items="${shoppingCart.contents}" varStatus="">
                    <tr>
                        <td>${item.key.name} ( ${item.key.brand})</td>
                        <td>$${item.key.price}</td>
                        <td>${item.value}</td>

                    </tr>
                </c:forEach>
                <tr colspan="3">
                    <td>
                        <p>
                            <fmt:message key="invoice.partialSum" /> : 
                            $${shoppingCart.sum} 
                        </p>

                        <p>
                            <fmt:message key="invoice.gstTaxes" /> : 
                            $${shoppingCart.gstTaxes}
                        </p>
                        <p>
                            <fmt:message key="invoice.qstTaxes" /> : 
                            $${shoppingCart.qstTaxes}
                        </p>
                    </td>
                </tr>

                <tr colspan="3">
                    <td>
                        <h4>
                            <fmt:message key="invoice.finalSum" /> : 
                            $${shoppingCart.totalWrittenSum}
                        </h4>
                    </td>
                </tr>

            </tbody>
        </table>

        <h4><a href="HomeServlet">
                <fmt:message key="invoice.backHome" />
            </a>
        </h4>






    </body>
</html>
