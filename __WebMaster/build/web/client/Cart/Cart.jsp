<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "model.Users.*" %>
<%@page import = "model.Product.*" %>
<%@page import = "model.Cart.*" %>
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
    List<Cart> lst = (List<Cart>) request.getAttribute("lst");
    ProductDAO proDAO = new ProductDAO();
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Cart Management</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="/_WebMaster/assests/css/bootstrap.min.css"/>
        <link rel="stylesheet" type="text/css" href="/_WebMaster/assests/css/style.css"/>
    </head>
    <body>
        <!--nav-->
        <%@include file="/navigator/Navbar.jsp" %>
        <%--<%@include file="/navigator/SideBarCart.jsp" %>--%>
        <%@include file="/navigator/Toast.jsp" %>
        
        <!--Main information-->
        <div class="wrapper bg-dark" style="height: fit-content; min-height: 100vh">
            <div class="container main" style="margin-top: 62px">
                <div class="row bg-dark" style="height: fit-content; margin-bottom: 90px">
                    <div class="col-md-12 table-responsive">
                        <table class="table table-hover table-bordered">
                            <tr class="table-info">
                                <th class="col-md-2 text-center">CartID</th>
                                <th class="col-md-4 text-center">Name</th>
                                <th class="col-md-2 text-center">File Type</th>
                                <th class="col-md-1 text-center">Cost</th>
                                <th class="col-md-1 text-center">Action</th>
                            </tr>
                            <%
                                if(lst != null){
                                    for(Cart x: lst) {
                                        Product a = proDAO.getProduct(x.getProductID());
                            %>
                            <tr>
                                <td class="text-light "><%= x.getId() %></td>
                                <td class="text-light "><%= a.getProductName() %></td>
                                <td class="text-light "><%= a.getType() %></td>
                                <td class="text-light "><%= a.getCost() %> <span class="text-secondary">$</span></td>
                                
                                <td class="" style="display: flex; align-items: center; justify-content: center;">
                                    <form action="/_WebMaster/control" method="POST">
                                        <input type="hidden" name="productName" value="<%=a.getProductName()%>"/>
                                        <input type="hidden" name="cartID" value="<%=x.getId()%>"/>
                                        <input type="hidden" name="requestAction" value="Delete"/>
                                        <button type="submit" class="btn btn-outline-danger me-3 border-0 p-0" title="Delete">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-x-square" viewBox="0 0 16 16">
                                                <path d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>
                                                <path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
                                            </svg>
                                        </button>
                                    </form>
                                    <form action="/_WebMaster/control" method="POST">
                                        <input type="hidden" name="purchase" value="<%=a.getId()%>"/>
                                        <input type="hidden" name="requestAction" value="Purchase"/>
                                        <button type="submit" class="btn btn-outline-success border-0 p-0" title="Purchase">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-credit-card-2-front-fill" viewBox="0 0 16 16">
                                                <path d="M0 4a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V4zm2.5 1a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h2a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5h-2zm0 3a.5.5 0 0 0 0 1h5a.5.5 0 0 0 0-1h-5zm0 2a.5.5 0 0 0 0 1h1a.5.5 0 0 0 0-1h-1zm3 0a.5.5 0 0 0 0 1h1a.5.5 0 0 0 0-1h-1zm3 0a.5.5 0 0 0 0 1h1a.5.5 0 0 0 0-1h-1zm3 0a.5.5 0 0 0 0 1h1a.5.5 0 0 0 0-1h-1z"/>
                                            </svg>
                                        </button>
                                    </form>
                                </td>
                            </tr>
                            <%}}%>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    <script type="text/javascript" type="text/javascript" src="bootstrap/js/bootstrap.bundle.js"></script>
    </body>
</html>
