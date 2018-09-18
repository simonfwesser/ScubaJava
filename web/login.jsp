
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
        <br>

        <!--https://getbootstrap.com/docs/4.1/examples/sign-in/-->

        <form class="form-signin" action="Traitement">
            <input type="text" name="action" value="login" hidden />
            <img class="mb-4" src="img/logo.png" alt="" width="72" height="72">
            <h1 class="h3 mb-3 font-weight-normal">Please sign in</h1>
            <label for="inputEmail" class="sr-only">Email address</label>
            <input 
                type="text" 
                name="email"
                id="inputEmail" 
                class="form-control" 
                placeholder="Email address" 
                value=""
                required autofocus>
            <!--<input type="email" id="inputEmail" class="form-control" placeholder="Email address" required autofocus>-->
            <label for="inputPassword" class="sr-only">Password</label>
            <input 
                type="password"
                name="password" 
                id="inputPassword" 
                class="form-control" 
                placeholder="Password"
                value=""
                required>
            <div class="checkbox mb-3">
                <label>
                    <input type="checkbox" value="remember-me"> Remember me
                </label>
            </div>
            <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
            <p class="mt-5 mb-3 text-muted">ScubaJava&copy; 2018</p>
        </form>


</html>
