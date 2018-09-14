
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" type="image/png" href="img/favicon.png"/>
        <link rel="stylesheet" href="style/bootstrap.css">
        <link rel="stylesheet" href="style/style_1.css">
        <title>index.jsp</title>
    </head>

    <%@include file="header.jspf" %>


    <body>
        <h2>Accédez au site en tant que</h2>

        <form action="login.jsp">
            <input type="submit" value="Membre" />
        </form>
        <form action="Traitement">
            <input type="submit" value="Visiteur" />
        </form>
    </body>


</html>
