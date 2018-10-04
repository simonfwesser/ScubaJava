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
                        <p>${item.key.name} ( ${item.key.brand})</p>
                        <span class="price text-info">  $${item.key.price}</span> 
                        <span class="count"> 
                            <fmt:message key="checkout.quantity" /> 
                            ${item.value}
                        </span>
                    </div>

                    <div class="col-sm-2 cart-detail-product">
                        <form action="CheckoutServlet">
                            <input type="hidden"  name="action" value="delete"/>
                            <input type="hidden"  name="sku" value="${item.key.sku}"/>
                            <button class="btn btn-xs btn-danger pull-right" type="submit">
                                X
                            </button>
                        </form>

                    </div>




                </div>
            </c:forEach>

            <c:choose>

                <c:when test="${not empty shoppingCart.contents}">

                    <div class="row">
                        <div class="offset-sm-4"></div>
                        <div class="col-sm-4">
                            <h5>
                                <fmt:message key="checkout.partialSum" /> : 
                                $${shoppingCart.sum}
                            </h5>
                            <h5>
                                <fmt:message key="checkout.gstTaxes" /> : 
                                $${shoppingCart.gstTaxes}
                            </h5>
                            <h5>
                                <fmt:message key="checkout.qstTaxes" /> : 
                                $${shoppingCart.qstTaxes}
                            </h5>

                            <h4>
                                <fmt:message key="checkout.finalSum" /> : 
                                $${shoppingCart.totalWrittenSum}
                            </h4>
                        </div>
                        <div class="offset-sm-4"></div>

                    </div>


                    <div class="row">
                        <form action="InvoiceServlet">
                            <button class="btn btn-primary btn-block" type="submit">
                                <fmt:message key="checkout.confirm" /> 
                            </button>
                        </form>
                    </div>

                </c:when>

                <c:when test="${empty shoppingCart.contents}">
                    <h4><a href="HomeServlet">
                            <fmt:message key="checkout.backHome" />
                        </a>
                    </h4>
                </c:when>


            </c:choose>


        </div>

    </body>
</html>
