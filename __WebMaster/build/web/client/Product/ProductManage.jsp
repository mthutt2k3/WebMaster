<%-- 
    Document   : UserManage
    Created on : Oct 5, 2023, 6:05:27 PM
    Author     : lap21
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "model.Product.*" %>
<%@page import = "model.Users.*" %>
<%@page import = "model.Purchased.*" %>
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
    if (session.getAttribute("x") != null){
        session.removeAttribute("x");
    }
%>

<%
    List<Product> lst = (List<Product>) session.getAttribute("lstProduct");
    PurchasedDAO puDAO = new PurchasedDAO();
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
                            <input type="hidden" name="target" value="ProductManage"/>
                            <input type="hidden" name="requestAction" value="Search"/>
                            <input type="search" name="input" class="search-input form-control" placeholder="Search product...">
                            <button type="submit" class="search-button"></button>
                        </form>
                    </div>
                    <div class="col-md-12">
                        <table class="table table-hover table-bordered">
                            <%
                                if(lst != null){
                            %>
                            <tr class="table-info">
                                <th class="col-md-1 text-center">
                                    <div style="display: flex">
                                        ID
                                        <%colName = "id";%>
                                        <%@include file="/client/Product/ProductSortForm.jsp"%>
                                    </div>
                                </th>
                                <th class="col-md-1 text-center">
                                    <div style="display: flex">
                                        Name
                                        <%colName = "productName";%>
                                        <%@include file="/client/Product/ProductSortForm.jsp"%>
                                    </div>
                                </th>
                                <th class="col-md-5 text-center">
                                    Description
                                </th>
                                <th class="col-md-1 text-center">
                                    <button class="btn p-0 dropdown-toggle fw-bold"
                                            id="typeDropdown" 
                                            role="button"
                                            data-bs-toggle="dropdown"
                                            aria-expanded="false"
                                            >
                                        Type
                                    </button>
                            <d class="dropdown-menu dropdown-menu-dark"
                               aria-labelledby="typeDropdown">
                                <li>
                                    <form action="/_WebMaster/control">
                                        <input type="hidden" name="requestAction" value="Get Product Type">
                                        <input type="hidden" name="target"value="ProductManage">
                                        <input type="hidden" name="type" value="">
                                        <button type="submit" 
                                                class="dropdown-item d-flex align-items-center"
                                                >
                                            All
                                        </button>
                                    </form>
                                </li>
                                <li>
                                    <form action="/_WebMaster/control">
                                        <input type="hidden" name="requestAction" value="Get Product Type">
                                        <input type="hidden" name="target"value="ProductManage">
                                        <input type="hidden" name="type" value="Java file">
                                        <button type="submit" 
                                                class="dropdown-item d-flex align-items-center"
                                                >
                                            Java file
                                        </button>
                                    </form>
                                </li>
                                <li>
                                    <form action="/_WebMaster/control">
                                        <input type="hidden" name="requestAction" value="Get Product Type">
                                        <input type="hidden" name="target"value="ProductManage">
                                        <input type="hidden" name="type" value="HTML file">
                                        <button type="submit" 
                                                class="dropdown-item d-flex align-items-center"
                                                >
                                            HTML file
                                        </button>
                                    </form>
                                </li>
                                <li>
                                    <form action="/_WebMaster/control">
                                        <input type="hidden" name="requestAction" value="Get Product Type">
                                        <input type="hidden" name="target"value="ProductManage">
                                        <input type="hidden" name="type" value="JSP file">
                                        <button type="submit" 
                                                class="dropdown-item d-flex align-items-center"
                                                >
                                            JSP file
                                        </button>
                                    </form>
                                </li>
                            </d>
                            </th>
                            <th class="col-md-1 text-center">
                                <div style="display: flex">
                                    Cost
                                    <%colName = "cost";%>
                                    <%@include file="/client/Product/ProductSortForm.jsp"%>
                                </div>
                            </th>
                            <th class="col-md-1 text-center">
                                <div style="display: flex">
                                    Purchased
                                    <%colName = "purchased";%>
                                    <%@include file="/client/Product/ProductSortForm.jsp"%>
                                </div>
                            </th>
                            <th class="col-md-1 text-center">
                                <div style="display: flex">
                                    Rate
                                    <%colName = "rate";%>
                                    <%@include file="/client/Product/ProductSortForm.jsp"%>
                                </div>
                            </th>
                            <th class="col-md-1 text-center">
                                Source
                            </th>
                            <th class="col-md-1 text-center">
                                Action
                            </th>
                            </tr>
                            <%for(Product x: lst) {%>
                            <tr>
                                <td class="text-light text-center"><%= x.getId() %></td>
                                <td class="text-light"><%= x.getProductName() %></td>
                                <td class="text-light"><%= x.getDescription() %></td>
                                <td class="text-light text-center"><%= x.getType() %></td>
                                <td class="text-warning text-center"><%= String.format("%.2f", x.getCost())%><span class="ms-1 text-secondary">$</span></td>
                                <td class="text-warning text-center"><%= x.getPurchased()%></td>
                                <td class="text-warning text-center"><%= x.getRate()%></td>
                                <td class="text-light text-center">
                                    <a target="_blank" href="<%= x.getSource()%>" title="<%= x.getSource()%>">
                                        Link
                                    </a>
                                </td>
                                <td class="" style="display: flex; align-items: center; justify-content: center;">
                                    <form action="/_WebMaster/control" method="POST">
                                        <input type="hidden" name="productName" value="<%= x.getProductName() %>"/>
                                        <input type="hidden" name="productID" value="<%= x.getId() %>"/>

                                        <input type="hidden" name='requestAction' value="Delete"/>
                                        <button type="submit" class="btn btn-outline-danger border-0 p-0" title="Delete">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-x-square" viewBox="0 0 16 16">
                                            <path d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>
                                            <path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
                                            </svg>
                                        </button>
                                    </form>
                                    <form action="/_WebMaster/control" method="POST">
                                        <input type="hidden" name="productID" value="<%= x.getId() %>"/>
                                        <input type="hidden" name='requestAction' value="Update Product"/>
                                        <button type="submit" class="btn btn-outline-success mx-1 border-0 p-0" title="Delete">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
                                            <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
                                            <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
                                            </svg>
                                        </button>
                                    </form>
                                </td>
                            </tr>
                            <% }}else{ %>
                            <div class="row h-auto w-auto mt-2" style="padding-left: 100px; padding-right: 100px">
                                <h1 class="text-warning text-center"> NO DATA</h1>
                            </div>
                            <%}%>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>

