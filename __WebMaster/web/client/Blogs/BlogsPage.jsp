<%-- 
    Document   : BlogPage
    Created on : Oct 7, 2023, 6:09:34 PM
    Author     : lap21
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "model.Blogs.*" %>
<%@page import = "model.Users.*" %>
<%@page import = "java.util.*" %>
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
    List<Blogs> lst = (List<Blogs>) request.getAttribute("lst");
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>WebMaster|Blogs</title>
        <link rel="stylesheet" type="text/css" href="/_WebMaster/assests/css/bootstrap.min.css"/>
        <link rel="stylesheet" type="text/css" href="/_WebMaster/assests/css/style.css"/>
    </head>
    <body>
        <%@include file="/navigator/Navbar.jsp" %>
        
        <div class="wrapper bg-dark" id="home">
            <div class="container bg-dark bg-opacity-50" style="min-height: 100vh; margin-top: 70px">
                
                <%
                    if(!lst.isEmpty()){
                        for(Blogs x: lst) {
                    %>
                        <div class="row h-auto w-auto mt-2" style="padding-left: 100px; padding-right: 100px">
                            <div class="col-md-2" style="background-image: none">
                                <form action="getpost">
                                    <button type="submit" style="border: none; padding: 0; background-color: transparent; outline: none;">
                                        <input type="hidden" name="id" value="<%=x.getId()%>">
                                        <img class="img img-thumbnail" src="<%=x.getPath()%>/images/thumbnail.png" alt="">
                                    </button>
                                </form>
                            </div>
                            <div class="col-md-10">
                                <div>
                                    <form action="getpost">
                                        <input type="hidden" name="id" value="<%=x.getId()%>">
                                        <input type="submit" class="bg-transparent border-0 text-info h2"
                                                value="<%=x.getTitle()%>"
                                        >
                                    </form>
                                    <div class="input-field">
                                        <%=x.getDescription()%>
                                    </div>
                                </div>  
                            </div>
                        </div>
                <%}} else{%>
                    <div class="row h-auto w-auto mt-2" style="padding-left: 100px; padding-right: 100px">
                        <h1 class="text-warning text-center"> NO DATA</h1>
                    </div>
                <%}%>
            </div>
        </div>
    </body>
</html>
