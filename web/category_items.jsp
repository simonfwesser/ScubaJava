<!DOCTYPE html>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <title>Home</title>
        <script src="script/navbarScript.js" type="text/javascript"></script>
        <link href="style/style.css" rel="stylesheet" type="text/css"/>
        <link href="style/bootstrap.css" rel="stylesheet" type="text/css"/>
        <meta charset="UTF-8">
    </head>
    <body>
        <%@include file="header.jspf" %>
        <div class="container-fluid">
            <br>
            <div class='row justify-content-center'><h2>${categoryName}</h2></div>
            <br>
            <div class="row justify-content-center">

                <c:forEach var="product" items="${listCategoryProducts}" varStatus="loop" >
                    <div class="col-sm-3"> 
                        <form method="POST" action="ProductServlet" class="text-center">
                            <input type="hidden" name="sku" value="${product.sku}">
                            <div class="card" 
                                 style="box-shadow: 5px 5px 5px #6394F8; 
                                 background-color: #fafbd9;
                                 padding : 5%; 
                                 margin : 10%;
                                 cursor: pointer;
                                 transition : all 0.5s;"
                                 onmouseover="this.style.opacity = 0.4; this.filters.alpha.opacity = 40;"
                                 onmouseout="this.style.opacity = 1;this.filters.alpha.opacity = 100;"
                                 onclick="this.parentNode.submit();">
                                <img class="card-img-top" 
                                     src="${product.image}" alt="${product.name}">
                                <div class="card-body" >
                                    <h5 class="card-title text-center" style = "min-height: 3em">${product.brand} ${product.name}</h5>
                                    <p class="card-text" >Price: $${product.price}</p>
                                    <p class="card-text" ><c:out value="${product.quantity gt 0 ? 'In stock' : 'Stockout'}"/></p>


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