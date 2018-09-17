<%-- 
    Document   : home
    Created on : 2018-09-10, 20:53:11
    Author     : utilisateur
--%>
<script src="script/navbarScript.js" type="text/javascript"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Home</title>
        <link href="style/style.css" rel="stylesheet" type="text/css"/>
        <link href="style/bootstrap.css" rel="stylesheet" type="text/css"/>
        <meta charset="UTF-8">
    </head>
    <body>
        <%@include file="header.jspf" %>
        <div class="container-fluid">
            <br>
            <br>
            <div class="row">
                <c:forEach var="product" items="${listProducts}" varStatus="loop" >
                    <div class="col-2">
                        <figure class=" border figure rounded">
                            <img class=" figure-img img-fluid" src="${product.image}" alt="${product.name}" height="160" width="240">
                            <figcaption class="figure-caption text-left">
                                <form id="form-id" action="ProductServlet" method="post">
                                    <input type="submit" class="btn btn-link" value="${product.brand} ${product.name}
                                           <c:forEach var="category" items="${product.category.categoryDetails}">
                                               ${category.categoryName}
                                           </c:forEach>">
                                    <input type="hidden" name="sku" value="${product.sku}">
                                </form>
                            </figcaption>
                            <figcaption class="figure-caption text-left">Price: $${product.price}</figcaption>  
                            <figcaption class="figure-caption text-left" style="<c:out value="${product.quantity gt 0 ? 'color:LimeGreen' : 'color:OrangeRed'}"/>">
                                <c:out value="${product.quantity gt 0 ? 'In stock' : 'Stockout'}"/>
                            </figcaption>
                        </figure>
                    </div>
                </c:forEach>
                <div class="col-2">
                    <c:forEach var="language" items="${listLanguages}" varStatus="loop" >
                        <img src="${language.languageImage}" alt="${language.languageName}" height="15" width="30"/>
                    </c:forEach>
                </div>
            </div>
        </div>
    </body>
</html>