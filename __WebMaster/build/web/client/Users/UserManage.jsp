<%-- 
    Document   : UserManage
    Created on : Oct 5, 2023, 6:05:27 PM
    Author     : lap21
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
%>

<%
    List<Users> lst = (List<Users>) session.getAttribute("lstUsers");
    String colName;
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Users Management</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="/_WebMaster/assests/css/bootstrap.min.css"/>
        <link rel="stylesheet" type="text/css" href="/_WebMaster/assests/css/style.css"/>
    </head>
    <body>
        <!--nav-->
        <%@include file="/navigator/Navbar.jsp" %>
        <%@include file="/navigator/Toast.jsp" %>
        <%@include file="/navigator/sideBarAdminManage.jsp" %>
        
        <!--Main information-->
        <div class="wrapper bg-dark" style="height: fit-content; min-height: 100vh">
            <div class="container main" style="margin-top: 62px">
                <div class="row bg-dark" style="height: fit-content">
                    <div class="mb-3 mt-2">
                        <form class="search-form mx-auto" action="/_WebMaster/control" method="GET">
                            <input type="hidden" name="target" value="UserManage"/>
                            <input type="hidden" name="requestAction" value="Search"/>
                            <input type="search" name="input" class="search-input form-control" placeholder="Search user...">
                            <button type="submit" class="search-button"></button>
                        </form>
                    </div>
                    <div class="col-md-12">
                        <table class="table table-hover table-bordered">
                            <tr class="table-info">
                                <th class="col-md-2 text-center">
                                    <div style="display: flex">
                                        First Name
                                        <%colName = "firstName";%>
                                        <%@include file="/client/Users/UsersSortForm.jsp"%>
                                    </div>
                                </th>
                                <th class="col-md-2 text-center">
                                    <div style="display: flex">
                                        Last Name
                                        <%colName = "lastName";%>
                                        <%@include file="/client/Users/UsersSortForm.jsp"%>
                                    </div>
                                </th>
                                <th class="col-md-2">Email/Username</th>
                                <th class="col-md-2">Password</th>
                                <th class="col-md-1 text-center">
                                    <div style="display: flex">
                                        Admin
                                        <%colName = "role";%>
                                        <%@include file="/client/Users/UsersSortForm.jsp"%>
                                    </div>
                                </th>
                                <th class="col-md-1">Premium</th>
                                <th class="col-md-2">Action</th>
                            </tr>
                            <%
                                if(lst != null){
                                    for(Users x: lst) {
                            %>
                            <tr>
                                <td class="text-light"><%= x.getFirstName() %></td>
                                <td class="text-light"><%= x.getLastName() %></td>
                                <td class="text-light"><%= x.getEmail() %></td>
                                <td class="text-light"><%= x.getPassword() %></td>
                                <td>
                                    <input type="checkbox" <%= x.isAdmin() ? "checked" : "" %> disabled/>
                                </td>
                                <td>
                                    <input type="checkbox" <%= x.isPremium() ? "checked" : "" %> disabled/>
                                </td>
                                <% if (x.getEmail().equals(xUser.getEmail())) { %>
                                    <td class="text-info">You</td>
                                <% } else { %>
                                <td class="form-control" style="display: flex">
                                        <form action="/_WebMaster/control" method="POST">
                                            <input type="hidden" name="email" value="<%=x.getEmail()%>"/>
                                            <input type="hidden" name='requestAction' value="Delete"/>
                                            <button type="submit" class="btn btn-outline-danger border-0 p-0" title="Delete">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-trash3-fill" viewBox="0 0 16 16">
                                                    <path d="M11 1.5v1h3.5a.5.5 0 0 1 0 1h-.538l-.853 10.66A2 2 0 0 1 11.115 16h-6.23a2 2 0 0 1-1.994-1.84L2.038 3.5H1.5a.5.5 0 0 1 0-1H5v-1A1.5 1.5 0 0 1 6.5 0h3A1.5 1.5 0 0 1 11 1.5Zm-5 0v1h4v-1a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 0-.5.5ZM4.5 5.029l.5 8.5a.5.5 0 1 0 .998-.06l-.5-8.5a.5.5 0 1 0-.998.06Zm6.53-.528a.5.5 0 0 0-.528.47l-.5 8.5a.5.5 0 0 0 .998.058l.5-8.5a.5.5 0 0 0-.47-.528ZM8 4.5a.5.5 0 0 0-.5.5v8.5a.5.5 0 0 0 1 0V5a.5.5 0 0 0-.5-.5Z"/>
                                                </svg>
                                            </button>
                                        </form>
                                        <%if(!x.isAdmin()){%>
                                            <form action="/_WebMaster/control" method="POST">
                                                <input type="hidden" name="email" value="<%=x.getEmail()%>"/>
                                                <input type="hidden" name="role" value="admin"/>
                                                <input type="hidden" name='requestAction' value="Set Role"/>
                                                <button type="submit" class="btn btn-outline-warning border-0 p-0" title="Set admin">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-person-fill-gear" viewBox="0 0 16 16">
                                                      <path d="M11 5a3 3 0 1 1-6 0 3 3 0 0 1 6 0Zm-9 8c0 1 1 1 1 1h5.256A4.493 4.493 0 0 1 8 12.5a4.49 4.49 0 0 1 1.544-3.393C9.077 9.038 8.564 9 8 9c-5 0-6 3-6 4Zm9.886-3.54c.18-.613 1.048-.613 1.229 0l.043.148a.64.64 0 0 0 .921.382l.136-.074c.561-.306 1.175.308.87.869l-.075.136a.64.64 0 0 0 .382.92l.149.045c.612.18.612 1.048 0 1.229l-.15.043a.64.64 0 0 0-.38.921l.074.136c.305.561-.309 1.175-.87.87l-.136-.075a.64.64 0 0 0-.92.382l-.045.149c-.18.612-1.048.612-1.229 0l-.043-.15a.64.64 0 0 0-.921-.38l-.136.074c-.561.305-1.175-.309-.87-.87l.075-.136a.64.64 0 0 0-.382-.92l-.148-.045c-.613-.18-.613-1.048 0-1.229l.148-.043a.64.64 0 0 0 .382-.921l-.074-.136c-.306-.561.308-1.175.869-.87l.136.075a.64.64 0 0 0 .92-.382l.045-.148ZM14 12.5a1.5 1.5 0 1 0-3 0 1.5 1.5 0 0 0 3 0Z"/>
                                                    </svg>
                                                </button>
                                            </form>
                                        <%}else{%>
                                            <form action="/_WebMaster/control" method="POST">
                                                <input type="hidden" name="email" value="<%=x.getEmail()%>"/>
                                                <input type="hidden" name="role" value="user"/>
                                                <input type="hidden" name='requestAction' value="Set Role"/>
                                                <button type="submit" class="btn btn-outline-info border-0 p-0" title="Set user">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-person-fill-gear" viewBox="0 0 16 16">
                                                      <path d="M11 5a3 3 0 1 1-6 0 3 3 0 0 1 6 0Zm-9 8c0 1 1 1 1 1h5.256A4.493 4.493 0 0 1 8 12.5a4.49 4.49 0 0 1 1.544-3.393C9.077 9.038 8.564 9 8 9c-5 0-6 3-6 4Zm9.886-3.54c.18-.613 1.048-.613 1.229 0l.043.148a.64.64 0 0 0 .921.382l.136-.074c.561-.306 1.175.308.87.869l-.075.136a.64.64 0 0 0 .382.92l.149.045c.612.18.612 1.048 0 1.229l-.15.043a.64.64 0 0 0-.38.921l.074.136c.305.561-.309 1.175-.87.87l-.136-.075a.64.64 0 0 0-.92.382l-.045.149c-.18.612-1.048.612-1.229 0l-.043-.15a.64.64 0 0 0-.921-.38l-.136.074c-.561.305-1.175-.309-.87-.87l.075-.136a.64.64 0 0 0-.382-.92l-.148-.045c-.613-.18-.613-1.048 0-1.229l.148-.043a.64.64 0 0 0 .382-.921l-.074-.136c-.306-.561.308-1.175.869-.87l.136.075a.64.64 0 0 0 .92-.382l.045-.148ZM14 12.5a1.5 1.5 0 1 0-3 0 1.5 1.5 0 0 0 3 0Z"/>
                                                    </svg>
                                                </button>
                                            </form>
                                        <%}%>
                                    </td>
                                <% } %>
                            </tr>
                            <% }} %> 
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>

