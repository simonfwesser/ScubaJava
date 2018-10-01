<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib  prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page errorPage="error.jsp" %>
<%@ page pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>

    <body>
        <%@include file="header.jspf" %>


        <div class="container">

            <div class="row cart-detail">
                <c:forEach var="item" items="${shoppingCart.contents}" varStatus="">
                    <div class="row cart-detail-line">
                        <div class="col-lg-3 col-sm-3 col-3 cart-detail-img">
                            <img src="${item.getKey().image}">
                        </div>
                        <div class="col-lg-7 col-sm-7 col-7 cart-detail-product">
                            <p>${item.getKey().name} ( ${item.getKey().brand})</p>
                            <span class="price text-info">  ${item.getKey().price}</span> 
                            <span class="count"> 
                                Quantity: 
                                ${item.getValue()}
                            </span>

                        </div>
                            
                        <div class="col-lg-2 col-sm-2 col-2 cart-detail-product">
                            <form action="CheckoutServlet">
                                <input type="hidden"  name="action" value="delete"/>
                                <input type="hidden"  name="sku" value="${item.getKey().sku}"/>
                                <button class="btn btn-xs btn-danger pull-right" type="submit">
                                    X
                                </button>
                            </form>

                        </div>
                    </div>
                </c:forEach>
            </div>

            <div class="row">
                <form action="InvoiceServlet">
                    <button type="submit">
                        Confirm order
                    </button>
                </form>
            </div>
        </div>

    </body>
</html>
