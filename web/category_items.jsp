<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib  prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page errorPage="WEB-INF/error.jsp" %>
<%@ page pageEncoding="UTF-8" %>

<!--
A11 - Programmation d'applications WEB
Projet de session.
Etudiants: 
- GHODBANE, Mohammed El Amine (1895101)
- TOULIATOS, Alexander (9736109)
-->

<!DOCTYPE html>
<html>
    <head>
        <title>Home</title>
        <meta charset="UTF-8">
        <link href="style/style.css" rel="stylesheet" type="text/css"/>
        <link href="style/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="style/categoryItemsStyle.css" rel="stylesheet" type="text/css"/>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="script/categoryItemsScript.js" type="text/javascript"></script>

    </head>
    <body>

        <%@include file="header.jspf" %>

        <div class="container-fluid" >
            <br>
            <div class='row justify-content-center'><h2>${categoryName}</h2></div>
            <br>
            <div class="row justify-content-center">

                <c:forEach var="product" items="${listCategoryProducts}" varStatus="loop" >
                    <div class="col-sm-3"> 
                        <form method="GET" action="ProductServlet" class="text-center">
                            <input type="hidden" name="sku" value="${product.sku}">
                            <div class="card">
                                <img class="card-img-top" 
                                     src="${product.image}" alt="${product.name}">
                                <div class="card-body" >
                                    <h5 class="card-title text-center">${product.brand} ${product.name}</h5>
                                    <p class="card-text" >
                                        <fmt:message key="categoryItems.price" /> :
                                        $${product.price}</p>
                                    <p class="card-text" >
                                        <c:choose>
                                            <c:when test="${product.quantity gt 0}">
                                                <span class="in-stock">
                                                    <fmt:message key="categoryItems.inStock" />
                                                </span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="out-of-stock">
                                                    <fmt:message key="categoryItems.outOfStock" />
                                                </span>
                                            </c:otherwise>
                                        </c:choose>
                                    </p>


                                </div>
                            </div>   
                        </form>     
                    </div>  
                </c:forEach>
            </div>
            <div class='container-fluid'>
                <div class="col-2">
                    <c:forEach var="language" items="${listLanguages}" varStatus="loop" >
                        <img src="${language.languageImage}" alt="${language.languageName}" height="15" width="30"/>
                    </c:forEach>
                </div>
            </div>
        </div>
    </body>
</html>