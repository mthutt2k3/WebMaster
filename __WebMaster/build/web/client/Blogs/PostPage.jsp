<%-- 
    Document   : PostPage
    Created on : Oct 7, 2023, 3:11:30 PM
    Author     : lap21
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "model.Blogs.*" %>
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
<%
    Blogs blog = (Blogs) request.getAttribute("blog");
    String path = "/" + (String)blog.getPath() + "/post.jsp";
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Document|WebMaster</title>
        <link rel="stylesheet" type="text/css" href="/_WebMaster/assests/css/bootstrap.min.css"/>
        <link rel="stylesheet" type="text/css" href="/_WebMaster/assests/css/style.css"/>
    </head>
    <body>
        <%@include file="/navigator/Navbar.jsp" %>
        
        <!--First Page-->
        <div class="wrapper bg-dark" id="home">
            <div class="container bg-dark bg-opacity-80" style="min-height: 100vh; margin-top: 70px">
            <!--post-->
            
            <jsp:include page="<%=path%>"/>
          
            <!--Other post-->
            </div>
        </div>
        
    </body>
</html>
