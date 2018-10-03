<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib  prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page errorPage="WEB-INF/error.jsp" %>
<%@ page pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>

    <head>
        <title>JSP Page</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="style/style.css" rel="stylesheet" type="text/css"/>
        <link href="style/checkoutStyle.css" rel="stylesheet" type="text/css"/>


    </head>

    <body>

        <%@include file="header.jspf" %>

        <div class="container">


            <c:forEach var="item" items="${shoppingCart.contents}" varStatus="">

                <div class="row cart-detail">
                    <div class="col-sm-3">
                        <img src="${item.getKey().image}">
                    </div>

                    <div class="col-sm-7">
                        <p>${item.getKey().name} ( ${item.getKey().brand})</p>
                        <span class="price text-info">  ${item.getKey().price}</span> 
                        <span class="count"> 
                            <fmt:message key="checkout.quantity" /> 
                            ${item.getValue()}
                        </span>
                    </div>

                    <div class="col-sm-2 cart-detail-product">
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


            <div class="row">
                <form action="InvoiceServlet">
                    <button type="submit">
                        <fmt:message key="checkout.confirm" /> 
                    </button>
                </form>
            </div>
        </div>

    </body>
</html>
