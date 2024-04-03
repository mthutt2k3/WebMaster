<%-- 
    Document   : Profile
    Created on : Oct 8, 2023, 12:35:16 PM
    Author     : lap21
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "model.Users.*" %>
<%@ page import="javax.servlet.http.*" %>
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
        <title><%= xUser.getFirstName() + " " + xUser.getLastName()%>|WebMaster</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="/_WebMaster/assests/css/bootstrap.min.css"/>
        <link rel="stylesheet" type="text/css" href="/_WebMaster/assests/css/style.css"/>
        
    <body>
        <%@include file="/navigator/Navbar.jsp" %>
        <%@include file="/navigator/Toast.jsp" %>
        <div class="wrapper bg-dark" id="home">
            <div class="container bg-dark bg-opacity-50" style="min-height: 100vh; margin-top: 70px">
                <div class="row w-auto p-5">
                    <div class="col-md-6">
                        <img class="img img-thumbnail w-100"
                             src="<%= xUser.isAdmin() ?  "/_WebMaster/assests/images/logo/admin.png" : "/_WebMaster/assests/images/logo/Users.png"%>"
                        >
                    </div>
                    <div class="col-md-6 bg-transparent p-5">
                        <h1
                            class=""
                            style="color: #0ee8f7"
                        >
                            <%= xUser.getFirstName() + " " + xUser.getLastName()%>
                            <span>
                                <a href="/_WebMaster/client/Users/ChangeInfo.jsp" title="Edit">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-pencil" style="color: #0ee8f7" viewBox="0 0 16 16">
                                        <path d="M12.146.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1 0 .708l-10 10a.5.5 0 0 1-.168.11l-5 2a.5.5 0 0 1-.65-.65l2-5a.5.5 0 0 1 .11-.168l10-10zM11.207 2.5 13.5 4.793 14.793 3.5 12.5 1.207 11.207 2.5zm1.586 3L10.5 3.207 4 9.707V10h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.293l6.5-6.5zm-9.761 5.175-.106.106-1.528 3.821 3.821-1.528.106-.106A.5.5 0 0 1 5 12.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.468-.325z"/>
                                    </svg>
                                </a>
                            </span>
                            
                        </h1>
                        <h2
                            class=""
                            style="color: #ffcd39"
                        >
                            <%= xUser.isAdmin() ?  "Admin" : "User"%>
                        </h2>
                        <div class="h4" style="color: plum">
                                Balance: 
                                <span id="balance" class="fw-semibold">
                                <%= String.format("%.2f", xUser.getBalance())%>
                                </span>
                                $
                                <span>
                                    <a href="/_WebMaster/client/Users/TopUpBalance.jsp" title="Top-up balance">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-wallet" style="color: plum" viewBox="0 0 16 16">
                                          <path d="M0 3a2 2 0 0 1 2-2h13.5a.5.5 0 0 1 0 1H15v2a1 1 0 0 1 1 1v8.5a1.5 1.5 0 0 1-1.5 1.5h-12A2.5 2.5 0 0 1 0 12.5V3zm1 1.732V12.5A1.5 1.5 0 0 0 2.5 14h12a.5.5 0 0 0 .5-.5V5H2a1.99 1.99 0 0 1-1-.268zM1 3a1 1 0 0 0 1 1h12V2H2a1 1 0 0 0-1 1z"/>
                                        </svg>
                                    </a>
                                </span>
                        </div>
                        <form action="/_WebMaster/client/Users/ChangePassword.jsp">
                            <input 
                                class="btn btn-outline-light"
                                type="submit" 
                                name="requestAction" 
                                value="Change password">
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
