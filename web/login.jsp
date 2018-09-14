
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" type="image/png" href="img/favicon.png"/>
        <link rel="stylesheet" href="style/bootstrap.css">
        <link rel="stylesheet" href="style/style_1.css">
        <title>login.jsp</title>
    </head>

    <%@include file="header.jspf" %>


    <body>
        <h2>Accédez au site en tant que</h2>

        <form action="Traitement">
            <table border="1">
                <tbody>
                    <tr>
                        <td>courriel</td>
                        <td><input type="text" name="email" value="" /></td>
                    </tr>
                    <tr>
                        <td>mot de passe</td>
                        <td><input type="text" name="password" value="" /></td>
                    </tr>
                    <tr>
                        <td colspan = "2">
                            <input type="submit" value="Login" />
                        </td>
                    </tr>
                </tbody>
            </table>
            <input type="text" name="action" value="login" hidden />
        </form>
    </body>


</html>
