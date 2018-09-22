
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

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

</body>
</html>
