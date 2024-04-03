<%-- 
    Document   : ChangePassword
    Created on : Oct 8, 2023, 2:19:36 PM
    Author     : lap21
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "model.Users.*" %>
<%@page import = "java.util.*" %>

<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    session = request.getSession(false);
    Users xUser = new Users();
    if (session.getAttribute("user") != null) {
       xUser = (Users) session.getAttribute("user");
    } else {
        response.sendRedirect("/_WebMaster/client/Users/login.jsp");
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="/_WebMaster/assests/css/bootstrap.min.css"/>
        <link rel="stylesheet" type="text/css" href="/_WebMaster/assests/css/style_login.css"/>
        <title>Change Password|WebMaster</title>
    </head>
    <body>
        <%@include file="/navigator/Toast.jsp" %>
        <div class="wrapper">
            <div class="container main">
                <div class="row">
                    <div class="col-md-6 side-image" style="background-image: url(<%= xUser.isAdmin() ?  "/_WebMaster/assests/images/logo/admin.png" : "/_WebMaster/assests/images/logo/Users.png"%>)">
                    </div>
                    <div class="col-md-6 right">
                        <div class="input-box">
                           <header>Change Password</header>
                           <form action="/_WebMaster/control" method="POST">
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
                                    <input type="submit" class="submit" name="requestAction" value="Change password">
                                </div>
                           </form>
                        </div>  
                    </div>
                </div>
            </div>
        </div>

        <script type="text/javascript" type="text/javascript" src="/_WebMaster/assests/js/bootstrap.bundle.js"></script>
    </body>
</html>
