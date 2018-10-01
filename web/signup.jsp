<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib  prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page errorPage="error.jsp" %>
<%@ page pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
    <head>
        <title>signup.jsp</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" type="image/png" href="img/favicon.png"/>
        <link href="style/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="style/font-awesome.css" rel="stylesheet" type="text/css"/>
        <link href="style/style.css" rel="stylesheet" type="text/css"/>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="script/signupScript.js" type="text/javascript"></script>
        
    </head>

    <body>

        <%@include file="header.jspf" %>

        <div class="container">
            <form class="form-signup form-horizontal" role="form" method="POST" action="SignUpServlet">

                <div class="row">
                    <div class="col-md-12">
                        <h2>
                            <fmt:message key="signup.newCustomer" />
                        </h2>
                        <hr>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <div class="input-group mb-2 mr-sm-2 mb-sm-0">
                                <div class="input-group-addon" style="width: 2.6rem"><i class="fa fa-at"></i></div>
                                <input 
                                    type="text" 
                                    name="email" 
                                    class="form-control" 
                                    id="email"
                                    placeholder='<fmt:message key="signup.email" />'
                                    validity ='<fmt:message key="signup.validity" /> : <fmt:message key="signup.email" />'
                                    required 
                                    autofocus>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <div class="input-group mb-2 mr-sm-2 mb-sm-0">
                                <div class="input-group-addon" style="width: 2.6rem"><i class="fa fa-user"></i></div>
                                <input 
                                    type="text" 
                                    name="firstname" 
                                    class="form-control" 
                                    id="name"
                                    placeholder='<fmt:message key="signup.firstName" />'
                                    validity ='<fmt:message key="signup.validity" /> : <fmt:message key="signup.firstName" />'
                                    required 
                                    autofocus>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <div class="input-group mb-2 mr-sm-2 mb-sm-0">
                                <div class="input-group-addon" style="width: 2.6rem"><i class="fa fa-user"></i></div>
                                <input 
                                    type="text" 
                                    name="lastname" 
                                    class="form-control" 
                                    id="name"
                                    placeholder='<fmt:message key="signup.lastName" />'
                                    validity ='<fmt:message key="signup.validity" /> : <fmt:message key="signup.lastName" />'
                                    required 
                                    autofocus>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <div class="input-group mb-2 mr-sm-2 mb-sm-0">
                                <div class="input-group-addon" style="width: 2.6rem"><i class="fas fa-map-marker-alt"></i></div>
                                <input 
                                    type="text" 
                                    name="address" 
                                    class="form-control" 
                                    id="name"
                                    placeholder='<fmt:message key="signup.address" />' 
                                    validity ='<fmt:message key="signup.validity" /> : <fmt:message key="signup.address" />'
                                    required 
                                    autofocus>
                            </div>
                        </div>
                    </div>
                </div>


                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group has-danger">
                            <div class="input-group mb-2 mr-sm-2 mb-sm-0">
                                <div class="input-group-addon" style="width: 2.6rem"><i class="fa fa-key"></i></div>
                                <input 
                                    type="password" 
                                    name="password" 
                                    class="form-control" 
                                    id="password"
                                    placeholder='<fmt:message key="signup.password" />'  
                                    validity ='<fmt:message key="signup.validity" /> : <fmt:message key="signup.password" />'
                                    required>
                            </div>
                        </div>
                    </div>
                </div>


                <div class="row">
                    <div class="col-md-3"></div>
                    <div class="col-md-6">
                        <button 
                            type="submit" 
                            class="btn btn-success">
                            <i class="fa fa-user-plus"></i>
                            <fmt:message key="signup.signup" />
                        </button>
                    </div>
                </div>

            </form>
        </div>
    </body>
    <!-- Source : https://bootsnipp.com/snippets/0BVEA -->
</html>
