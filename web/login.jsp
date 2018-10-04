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
        <title>login.jsp</title>
    </head>

    <%@include file="header.jspf" %>


    <body>
        <br>

        <!--https://getbootstrap.com/docs/4.1/examples/sign-in/-->

        <form class="form-signin" action="SignInServlet" method="post">
            <input type="text" name="action" value="login" hidden />
            <img class="mb-4" src="images/logo.png" alt="" width="72" height="72">
            <h1 class="h3 mb-3 font-weight-normal">
                <fmt:message key="login.title" />
            </h1>
            <label for="inputEmail" class="sr-only">Email address</label>
            <input 
                type="email" 
                name="email"
                id="inputEmail" 
                class="form-control" 
                placeholder='<fmt:message key="login.email" />' 
                value=""
                required autofocus />

            <label for="inputPassword" class="sr-only">Password</label>
            <input 
                type="password"
                name="password" 
                id="inputPassword" 
                class="form-control" 
                placeholder='<fmt:message key="login.password" />'
                value=""
                required />
            <!--            <div class="checkbox mb-3">
                            <label>
                                <input type="checkbox" value="remember-me"> Remember me
                            </label>
                        </div>-->

            <button class="btn btn-lg btn-primary btn-block" type="submit">
                <fmt:message key="login.signIn" />
            </button> 

            <p>
                <fmt:message key="login.notClient" /> 
                <a href="signup.jsp">
                    <fmt:message key="login.clickHere" /> 
                </a>
            </p>
            <p class="mt-5 mb-3 text-muted">ScubaJava&copy; 2018</p>
            <br>
            <h4>Suggestions
                <h5>amine@me.com : 123</h5>
                <h5>alex@me.com : 789</h5>
            </h4>

        </form>






</html>
