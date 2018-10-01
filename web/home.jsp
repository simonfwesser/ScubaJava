<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib  prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page errorPage="error.jsp" %>
<%@ page pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
    <head>
        <title>Home</title>
        <meta charset="UTF-8">
        <link href="style/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="style/style.css" rel="stylesheet" type="text/css"/>
        <link href="style/homeStyle.css" rel="stylesheet" type="text/css"/>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="script/homeScript.js" type="text/javascript"></script>
    </head>
    <body>
        
        <%@include file="header.jspf" %>

        <div class="container">
            <div class="row justify-content-center">
                <c:forEach var="categoryDetails" items="${listCategoryDetails}" varStatus="loop" >
                    <div class="col-sm-3"> 
                        <form method="POST" action="CategoryServlet" class="text-center">
                            <input type="hidden" name="categoryCode" value="${categoryDetails['category'].categoryCode}">
                            <div class="card">
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