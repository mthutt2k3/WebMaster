<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "model.Users.*" %>
<%@page import = "java.util.*" %>

<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    session = request.getSession(false);
    if (session.getAttribute("user") != null) {
        response.sendRedirect("/_WebMaster/client/MainPage.jsp");
    }
%>

<%
    String xEmail = (String) session.getAttribute("email");
    if(xEmail == null){
        xEmail="";
    }else{
        session.removeAttribute("email");
    }
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="/_WebMaster/assests/css/bootstrap.min.css"/>
        <link rel="stylesheet" type="text/css" href="/_WebMaster/assests/css/style_login.css">

        <title>Login|WebMaster</title>
    </head>
    <body>
        <%@include file="/navigator/Toast.jsp" %>
        <div class="wrapper">
            <div class="container main">
                <div class="row">
                    <div class="col-md-6 side-image" style="background-image: url(/_WebMaster/assests/images/background/Login.png)">
                        <img class="img" src="/_WebMaster/assests/images/logo/logo.png" alt="">
                    </div>
                    <div class="col-md-6 right">
                        <div class="input-box">
                            <header style="font-size: 60px">Login</header>
                            <form action="/_WebMaster/control" method="POST">
                                <div class="input-field">
                                    <input type="text" class="input" id="email" name="email" value="<%= xEmail %>" required="" autocomplete="off">
                                    <label for="email">Email/Username</label> 
                                </div> 
                                <div class="input-field">
                                    <input type="password" class="input" id="pass" name="password" value="" required="">
                                    <label for="pass">Password</label>
                                </div> 
                                <div class="mx-2">
                                    <div class="font-monospace opacity-75" style="font-size: small; display: flex">
                                        <input type="checkbox" id="checkBox" name="rememberme" value="remember">
                                        <label class="mx-1" for="checkBox">Remember me</label>

                                        <span style="font-family: monospace; font-size: small; opacity: 100%; font-weight: unset; margin-left: auto">
                                            <a href="/_WebMaster/client/Users/ForgetPassword.jsp">Forgot password?</a>
                                        </span>
                                    </div>
                                </div>
                                <div class="input-field mt-4">
                                    <input type="submit" class="submit" name="requestAction" value="Login">
                                </div> 
                            </form>
                            <div class="signin">
                                <span>Don't have an account? <a href="/_WebMaster/client/Users/register.jsp">Register</a></span>
                            </div>
                        </div>  
                    </div>
                </div>
            </div>
        </div>
        <script type="text/javascript" type="text/javascript" src="/_WebMaster/assests/js/bootstrap.bundle.js"></script>
    </body>
</html>