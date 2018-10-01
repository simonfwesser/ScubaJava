<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib  prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" type="image/png" href="img/favicon.png"/>
        <link rel="stylesheet" href="style/bootstrap.css">
        <link rel="stylesheet" href="style/style_1.css">
        <title>error.jsp</title>
    </head>

    <%@include file="header.jspf" %>


    <body>
        <h1>
            <fmt:bundle basename="WebsiteResource">
                <fmt:message key="error.generalError" /><br/>
            </fmt:bundle>
        </h1>
        <h2>${specificError}</h2>

        <form action="home.jsp">
            <input type="submit" value="Retour" />
        </form>
    </body>


</html>
