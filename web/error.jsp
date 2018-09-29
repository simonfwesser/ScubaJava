
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <h1>Une erreur est survenue !</h1>
        <h2>${errorMessage}</h2>

        <form action="home.jsp">
            <input type="submit" value="Retour" />
        </form>
    </body>


</html>
