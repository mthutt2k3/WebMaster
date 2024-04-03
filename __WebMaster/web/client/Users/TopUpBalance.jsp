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

<%
    String err = (String) request.getAttribute("alert");
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
        <div class="wrapper">
            <div class="container main">
                <div class="row">
                    <div class="col-md-6 side-image" style="background-image: url(<%= xUser.isAdmin() ?  "/_WebMaster/assests/images/logo/admin.png" : "/_WebMaster/assests/images/logo/Users.png"%>)">
                    </div>
                    <div class="col-md-6 right">
                        <div class="input-box">
                            <header>Top-up-balance</header>
                            <form action="/_WebMaster/control" method="POST">
                                <div class="input-field">
                                    <div>Amount</div>
                                    <input type="number" class="input" pattern="^\d+(\.\d+)?$" placeholder="00.00$" min="0" step="0.01" name="balance" placeholder="...$" value="" required="">
                                </div>

                                <div class="input-field">
                                    <div>Card information</div>
                                    <input type="text" class="input" placeholder="1234 1234 1234 1234"  value="1111 2222 3333 4444" required>
                                    <input type="text" class="input" placeholder="MM/YY" value="12/30" required>
                                    <input type="text" class="input" placeholder="CVC" value="121" required>
                                </div>

                                <% if(err != null){ %>
                                <div class="alert alert-danger p-1 mx-2" style="" role="alert">
                                    <%= err %>
                                </div>
                                <% } %>

                                <div class="input-field">
                                    <input type="submit" class="submit" name="requestAction" value="Top-up Balance">
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
