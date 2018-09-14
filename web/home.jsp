
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
        <h1>Hello Alex!</h1>
        <%@include file="header.jspf" %>
        
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <h4>À propos des Oceanic Manta Ray palmes:</h4>
                    <c:forEach var="product" items="${listProducts}" varStatus="loop" >
                        <figure class="figure">
                            <img class=" border figure-img img-fluid rounded" src="${product.image}" alt="${product.name}" height="180" width="270">
                            <figcaption class="figure-caption text-left">
                                <a href="ProductServlet?sku=${product.sku}"> 
                                    ${product.brand} ${product.name} 
                                    <span class="italic">(${product.details.toArray()[0].type})</span></a>
                            </figcaption>
                        </figure>

                        <p class="figure-caption text-left">
                            Price: $${product.price}</p>  
                        <p class="figure-caption text-left" 
                           style="${product.quantity gt 0 ? 'color:green' : 'color:red'}"/>
                        ${product.quantity gt 0 ? 'In stock' : 'Stockout'}
                        </p>


                        <c:forEach var="detail" items="${product.details}" varStatus="loop" >
                            ${detail.about}
                        </c:forEach>  
                    </c:forEach>
                </div>
            </div>
        </div>
    </body>
</html>