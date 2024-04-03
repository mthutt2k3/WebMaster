<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "model.Product.*" %>
<%@page import = "model.Cart.*" %>
<%@page import = "model.Users.*" %>
<%@page import = "model.Blogs.*" %>
<%@page import = "model.Product.*" %>
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
    List<Product> lstPro = (List<Product>) request.getAttribute("lstProduct");
    List<Blogs> lstBlog = (List<Blogs>) request.getAttribute("lstBlog");
    CartDAO cDAO = new CartDAO();
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product | WebMaster</title>
        <link rel="stylesheet" type="text/css" href="/_WebMaster/assests/css/bootstrap.min.css"/>
        <link rel="stylesheet" type="text/css" href="/_WebMaster/assests/css/style.css"/>
    </head>
    <body>
        <%@include file="/navigator/Navbar.jsp" %>
        <%@include file="/navigator/Toast.jsp" %>
        <%--<%@include file="/navigator/SideBarProductType.jsp" %>--%>
        
        <div class="wrapper bg-dark" id="home">
            <div class="container bg-dark bg-opacity-50" style="min-height: 100vh; margin-top: 70px">
                <!--Search product-->
                <%
                    if(!lstPro.isEmpty()){
                        for(Product x: lstPro) {
                    %>
                        <div class="row h-auto w-auto mt-2" style="padding-left: 100px; padding-right: 100px">
                            <div class="col-md-2" style="background-image: none">
                                <form action="/_WebMaster/control">
                                    <button type="submit" style="border: none; padding: 0; background-color: transparent; outline: none;">
                                        <input type="hidden" name="requestAction" value="Get Product">
                                        <input type="hidden" name="id" value="<%=x.getId()%>">
                                        <img class="img img-thumbnail" src="/_WebMaster/assests/images/product_thumnail/<%=x.getThumbnail()%>" alt="">
                                    </button>
                                </form>
                            </div>
                                
                            <div class="col-md-10">
                                <div>
                                    <div style="display: flex">
                                        <form action="/_WebMaster/control">
                                            <input type="hidden" name="requestAction" value="Get Product">
                                            <input type="hidden" name="id" value="<%=x.getId()%>">
                                            <input  type="submit" 
                                                    class="bg-transparent border-0 text-info h2"
                                                    value="<%=x.getProductName()%>"
                                            >
                                        </form>
                                        <div style="color: #f5c2c7; display: flex">
                                            <span class="text-info ms-2">
                                                <form action="/_WebMaster/control">
                                                    <input type="hidden" name="target"value="ProductPage">
                                                    <input type="hidden" name="requestAction" value="Get Product Type">
                                                    <input type="hidden" name="type" value="<%=x.getType()%>">
                                                    <button type="submit" 
                                                            class="btn btn-light btn-sm p-1"
                                                            style="background-color: #f5c2c7; border: none"
                                                    >
                                                        <%=x.getType()%>
                                                    </button>
                                                </form>

                                            </span>
                                        </div>
                                    </div>
                                    <div class="input-field">
                                        <%=x.getDescription()%>
                                    </div>
                                    
                                    <div style="display: flex">
                                        <h5 class="text-warning me-2">Best sale off today only</h5>
                                        <h5 class="text-decoration-line-through text-secondary me-3">
                                            $<%=x.getCost() + 10%>
                                        </h5>
                                        <h5 style="color: #20c997">
                                            $<%=x.getCost()%>
                                        </h5>
                                    </div>
                                    <%if(!cDAO.isAddedCart(x.getId(), xUser.getEmail())){%>
                                        <div>
                                            <form class="container me-5" action="/_WebMaster/control" method="POST">
                                                <input type="hidden" name="requestAction" value="Add to cart">
                                                <input type="hidden" name="productName" value="<%=x.getProductName()%>">
                                                <input type="hidden" name="productID" value="<%=x.getId()%>">
                                                <input type="hidden" name="email" value="<%=xUser.getEmail()%>">
                                                <!--<input type="hidden" name="requestAction" value="Add to cart">-->
                                                <button type="submit" class="btn btn-success btn-sm p-1 d-flex align-items-center">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-cart-fill me-2" viewBox="0 0 16 16">
                                                        <path d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
                                                    </svg>
                                                    Add to cart
                                                </button>
                                            </form>
                                        </div>
                                    <%}else{%>
                                        <div>
                                            <form class="container ms-2 mt-1 me-0" action="/_WebMaster/control">
                                                <input type="hidden" name="requestAction" value="View Cart">
                                                <button type="submit" class="btn btn-warning btn-sm p-1 d-flex">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-cart-fill me-2" viewBox="0 0 16 16">
                                                        <path d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
                                                    </svg>
                                                Added to Cart | View Cart
                                            </button>
                                        </form>
                                        </div>
                                    <%}%>
                                </div>  
                            </div>
                        </div>
                <%}}%>
                <!--Search blogs-->
                <%
                    if(!lstBlog.isEmpty()){
                        for(Blogs x: lstBlog) {
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
                <%
                    }} 
                    if(lstBlog.isEmpty() && lstPro.isEmpty()){
                %>
                    <div class="row h-auto w-auto mt-2" style="padding-left: 100px; padding-right: 100px">
                        <h1 class="text-warning text-center"> NO DATA</h1>
                    </div>
                <%}%>
            </div>
        </div>
    </body>
</html>
