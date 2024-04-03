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
    
    String xEmail = "";
    if(session.getAttribute("email") != null){
        xEmail = (String) session.getAttribute("email");
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
    
    <title>Reset your password|WebMaster</title>
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
                       <header>Reset your password</header>
                       <form action="/_WebMaster/control" method="POST">
                            <div class="input-field">
                                <input type="text" class="input" id="email" name="email" value="<%= xEmail %>" required="" autocomplete="off">
                                <label for="email">Email</label> 
                            </div> 
                            <div class="input-field">
                                    <input type="password" class="input" id="pass" name="old-password" value="" required="">
                                    <label for="pass">Old Password</label> 
                            </div> 
                            <div class="input-field">
                                <input type="password" class="input" id="pass" name="password" value="" required="">
                                <label for="pass">New Password</label>
                            </div> 
                            <div class="input-field">
                                <input type="password" class="input" id="pass" name="rePassword" value="" required="">
                                <label for="pass">Confirm password</label>
                            </div> 
                            <div class="input-field">
                                <input type="submit" class="submit" name="requestAction" value="Reset Password">
                            </div>
                       </form>
                       <div class="signin">
                            <span>Don't have an account? <a href="/_WebMaster/client/Users/register.jsp">Register</a></span>
                       </div>
                       <div class="signin mt-0">
                            <span>Or <a href="/_WebMaster/client/Users/login.jsp">Login</a></span>
                       </div>
                    </div>  
                </div>
            </div>
        </div>
    </div>
                            
    <script type="text/javascript" type="text/javascript" src="/_WebMaster/assests/js/bootstrap.bundle.js"></script>
</body>
</html>