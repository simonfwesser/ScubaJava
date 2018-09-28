<%-- 
    Document   : itemDetail
    Created on : 2018-09-16, 11:20:11
    Author     : 1895101
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="style/style.css" rel="stylesheet" type="text/css"/>
        <link href="style/bootstrap.css" rel="stylesheet" type="text/css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
</head>
<body>
    <%@include file="header.jspf" %>
    <br>
    <br>
    <div class="container">
        <div class="row">
            <div class="col-md-5">
                <img class=" figure border rounded img-fluid" src="${product.image}" alt="${product.name}" height="600" width="400" />
            </div>
            <div class="col-md-5 offset-1">
                <h3>${product.name}</h3>    
                <h5 style="color:#337ab7">${product.brand}</h5>
                <br>
                <h6 class="title-price"><small>PRICE</small></h6>
                <h5>$${product.price}</h5>
                <br>
                <h6 class="title-attr"><small>KEY FEATURES</small></h6>
                <c:forEach var="detail" items="${product.productDetails}" >
                    <c:if test="${detail.languages.languageCode.equals('EN')}" >
                        ${detail.keyFeatures}
                    </c:if>
                </c:forEach>
                <br>
                <form method="GET" action="ShoppingCartServlet">
                    <h6 class="title-attr"><small>QUANTITY</small></h6>                      
                    <input name="quantity" type="number" value="1" min="1" size="4" /><br>
                    <input type="hidden" name="sku" value="${product.sku}"/> >
                    <input type="submit" value="Add to cart" class="btn btn-success"/>
                </form>




                <h6><a href="#"><span class="glyphicon glyphicon-heart-empty" style="cursor:pointer;"></span> </a></h6>
            </div>                                        
        </div>                              
        <br>
        <div class="row">
            <div class="col-md-8" style="width:100%;border-top:1px solid silver">
                <h5 class="active">About ${product.brand} ${product.name}:</h5>
                <c:forEach var="detail" items="${product.productDetails}" >
                    <c:if test="${detail.languages.languageCode.equals('EN')}" >
                        ${detail.about}
                    </c:if>
                </c:forEach>
            </div>
            <div style="border-top:1px solid silver">
                <h5 class="active">${product.brand} ${product.name} featers:</h5>
                <c:forEach var="detail" items="${product.productDetails}" >
                    <c:if test="${detail.languages.languageCode.equals('EN')}" >
                        ${detail.features}
                    </c:if>
                </c:forEach>
            </div>
        </div>
        <div class="col-md-4"></div>
    </div>
</body>
</html>
