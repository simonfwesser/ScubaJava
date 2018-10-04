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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" type="image/png" href="img/favicon.png"/>
        <link rel="stylesheet" href="style/bootstrap.css">
        <link rel="stylesheet" href="style/style_1.css">
        <title>logout.jsp</title>
    </head>

    <%@include file="header.jspf" %>


    <body>
        <h1>${goodbyeMessage}</h1>
        <br>
        <h4>
            <a href="HomeServlet">
                ${backHome}
            </a>
        </h4>

    </body>


</html>
