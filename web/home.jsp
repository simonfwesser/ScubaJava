
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
            <div class="row">
                <div class="col-sm-12">
                    <div id='homepanel'>
                        <img class='img-fluid' src="images/aqua.jpg" alt="Scuba Java"/>
                    </div>
                </div>
            </div>
        </div>

        <br>

        <div class="container">
            <div class="row">
                <c:forEach var="categoryDetails" items="${listCategoryDetails}" varStatus="loop" >
                    <div class="col-sm-4">
                        <div class="card" style="width: 18rem; margin : 10px;">
                            <img class="card-img-top" 
                                 src="${categoryDetails['category'].categoryImage}" 
                                 alt="${categoryDetails['category'].categoryImage}">
                            <div class="card-body">
                                <h5 class="card-title">${categoryDetails['categoryName']}</h5>
                                <p class="card-text">${categoryDetails['about']}</p>
                                <form method="POST" action="CategoryServlet">
                                    <input type="submit" class="btn btn-link" value="Go somewhere" > 
                                    <input type="hidden" name="categoryCode" value="${categoryDetails['category'].categoryCode}">
                                </form>
                            </div>
                        </div>
                    </div>   
                </c:forEach>
            </div>
        </div>

    </body>
</html>