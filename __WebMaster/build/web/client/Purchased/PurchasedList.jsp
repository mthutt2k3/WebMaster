<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "model.Users.*" %>
<%@page import = "model.Product.*" %>
<%@page import = "model.Purchased.*" %>
<%@page import = "model.Rate.*" %>
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
    List<Purchased> lst = (List<Purchased>) request.getAttribute("lst");
    ProductDAO proDAO = new ProductDAO();
    RateDAO rDAO = new RateDAO();
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
    
        <!--Main information-->
        <div class="wrapper bg-dark" style="height: fit-content; min-height: 100vh">
            <div class="container main" style="margin-top: 62px">
                <div class="row bg-dark" style="height: fit-content">
                    <div class="col-md-12 table-responsive">
                        <table class="table table-hover table-bordered">
                            <tr class="table-info">
                                <th class="text-center">PurchaseID</th>
                                <th class="text-center">Name</th>
                                <th class="text-center">File Type</th>
                                <th class="text-center">Cost</th>
                                <th class="text-center">Purchased Date</th>
                                <th class="text-center">Download</th>
                                <th class="text-center">Rate</th>
                                <!--<th class="col-md-1 text-center">Rate</th>-->
                            </tr>
                            <%
                                if(lst != null){
                                    for(Purchased x: lst) {
                                        Product a = proDAO.getProduct(x.getProductID());
                                        boolean isRated = rDAO.isRated(a.getId(), xUser.getEmail());
                            %>
                            <tr>
                                <td class="text-light "><%= x.getId() %></td>
                                <td class="text-light "><%= a.getProductName() %></td>
                                <td class="text-light "><%= a.getType() %></td>
                                <td class="text-light "><%= a.getCost() %> <span class="text-secondary">$</span></td>
                                <td class="text-light "><%= x.getDate() %></td>
                                <td class="text-light ">
                                    <a  target="_blank"
                                        href="<%=a.getSource()%>"
                                        title="Download file"
                                        class="d-flex align-items-center text-center position-absolute">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-download" viewBox="0 0 16 16">
                                                <path d="M.5 9.9a.5.5 0 0 1 .5.5v2.5a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1v-2.5a.5.5 0 0 1 1 0v2.5a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2v-2.5a.5.5 0 0 1 .5-.5z"/>
                                                <path d="M7.646 11.854a.5.5 0 0 0 .708 0l3-3a.5.5 0 0 0-.708-.708L8.5 10.293V1.5a.5.5 0 0 0-1 0v8.793L5.354 8.146a.5.5 0 1 0-.708.708l3 3z"/>
                                            </svg>
                                    </a>
                                </td>
                                <td class="text-center">
                                    <%if(!isRated){%>
                                        <form action="/_WebMaster/control">
                                            <input type="hidden" name="requestAction" value="Get Product">
                                            <input type="hidden" name="id" value="<%=a.getId()%>">
                                            <input type="submit" class="btn btn-sm btn-outline-warning " value="Rate">
                                        </form>
                                    <%}else{%>
                                        <div class="text-light">Rated</div>
                                    <%}%>
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
