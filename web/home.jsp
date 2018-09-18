
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

        <div class="container">
            <div class="row justify-content-center">
                <c:forEach var="categoryDetails" items="${listCategoryDetails}" varStatus="loop" >
                    <div class="col-sm-3"> 
                        <form method="POST" action="CategoryServlet" class="text-center">
                            <input type="hidden" name="categoryCode" value="${categoryDetails['category'].categoryCode}">
                            <div class="card" 
                                 style="box-shadow: 5px 5px 5px rgba(0, 0, 255, 0.5); 
                                 background-color: #fafbd9;
                                 padding : 5%; 
                                 margin : 10%;
                                 cursor: pointer;
                                 transition : all 0.5s;"
                                 onmouseover="this.style.opacity = 0.4; this.filters.alpha.opacity = 40;"
                                 onmouseout="this.style.opacity = 1;this.filters.alpha.opacity = 100;"
                                 onclick="this.parentNode.submit();">
                                <img class="card-img-top" 
                                     src="${categoryDetails['category'].categoryImage}" 
                                     alt="${categoryDetails['category'].categoryImage}">
                                <div class="card-body" >
                                    <h5 class="card-title text-center" style = "min-height: 3em">${categoryDetails['categoryName']}</h5>
                                    <p class="card-text" >${categoryDetails['about']}</p>


                                </div>
                            </div>   
                        </form>     
                    </div>   
                </c:forEach>
            </div>
        </div>

    </body>
</html>