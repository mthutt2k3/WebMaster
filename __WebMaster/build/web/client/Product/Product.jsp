<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "model.Product.*" %>
<%@page import = "model.Cart.*" %>
<%@page import = "model.Users.*" %>
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
    Product x = (Product) request.getAttribute("product");
    CartDAO cDAO = new CartDAO();
    PurchasedDAO pDAO = new PurchasedDAO();
    RateDAO rDAO = new RateDAO();
    int isPurchased = pDAO.isPurchased(x.getId(), xUser.getEmail());
    boolean isAddedCart = cDAO.isAddedCart(x.getId(), xUser.getEmail());
    boolean isRated = rDAO.isRated(x.getId(), xUser.getEmail());
%>  
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product | WebMaster</title>
        <link rel="stylesheet" type="text/css" href="/_WebMaster/assests/css/bootstrap.min.css"/>
        <link rel="stylesheet" type="text/css" href="/_WebMaster/assests/css/style.css"/>
        <link rel="stylesheet" type="text/css" href="/_WebMaster/assests/css/Rate.css"/>
    </head>
    <body>
        <%@include file="/navigator/Navbar.jsp" %>
        <%@include file="/navigator/Toast.jsp" %>
        <div class="wrapper bg-dark" id="home" style="min-height: 915px">
            <!--post-->
        <div class="container bg-dark bg-opacity-80" style="height: 800px; margin-top: 80px">
            <div class="row h-auto w-auto p-5 d-flex align-items-center justify-content-center">
                <div class="col-md-6">
                    <img class="img img-thumbnail w-100" src="/_WebMaster/assests/images/product_thumnail/<%=x.getThumbnail()%>" alt="">
                </div>
                <div class="col-md-6 p-5">
                    <h1 >
                        <%=x.getProductName()%>
                    </h1>
                    <h5 style="color: #f5c2c7; display: flex">
                        File type:  
                        <span class="text-info ms-2">
                            <form action="/_WebMaster/control">
                                <input type="hidden" name="requestAction" value="Get Product Type">
                                <input type="hidden" name="target"value="ProductPage">
                                <input type="hidden" name="type" value="<%=x.getType()%>">
                                <button type="submit" 
                                        class="btn btn-light btn-sm p-1"
                                        style="background-color: #3dd5f3; border: none"
                                >
                                    <%=x.getType()%>
                                </button>
                            </form>

                        </span>
                    </h5>
                    <h5 style="color: #FE7; display: flex">
                        Rate: <%=x.getRate()%>/5*
                    </h5>
                    <P class="text-secondary">
                        <%=x.getDescription()%>
                    </P>
                    <ul>
                        <li class="text-warning">
                            Quality checked by WebMaster
                            <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-check" viewBox="0 0 16 16">
                                <path d="M10.97 4.97a.75.75 0 0 1 1.07 1.05l-3.99 4.99a.75.75 0 0 1-1.08.02L4.324 8.384a.75.75 0 1 1 1.06-1.06l2.094 2.093 3.473-4.425a.267.267 0 0 1 .02-.022z"/>
                            </svg>
                        </li>
                        <li class="text-warning">
                            Future updates
                            <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-check" viewBox="0 0 16 16">
                                <path d="M10.97 4.97a.75.75 0 0 1 1.07 1.05l-3.99 4.99a.75.75 0 0 1-1.08.02L4.324 8.384a.75.75 0 1 1 1.06-1.06l2.094 2.093 3.473-4.425a.267.267 0 0 1 .02-.022z"/>
                            </svg>
                        </li>
                        <li class="text-warning">
                            Buy one time, use life time
                            <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-check" viewBox="0 0 16 16">
                                <path d="M10.97 4.97a.75.75 0 0 1 1.07 1.05l-3.99 4.99a.75.75 0 0 1-1.08.02L4.324 8.384a.75.75 0 1 1 1.06-1.06l2.094 2.093 3.473-4.425a.267.267 0 0 1 .02-.022z"/>
                            </svg>
                        </li>
                    </ul>
                        <ul style="display: flex">
                            <h3 class="text-decoration-line-through text-secondary me-3">
                                $<%= String.format("%.2f", x.getCost() + 10)%>
                            </h3>
                            <h1 style="color: #20c997">
                                $<%= String.format("%.2f", x.getCost())%>
                            </h1>
                        </ul>
                            <%
                                if(isPurchased == 0){
                            %>
                            <!--IF NOT PURCHASED-->
                            <div style="display: flex">    
                                <form class="container" action="/_WebMaster/control" method="POST">
                                    <input type="hidden" name="purchase" value="<%=x.getId()%>">
                                    <input type="hidden" name="requestAction" value="Purchase">
                                    <button type="submit" class="btn btn-warning btn-lg d-flex align-items-center">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-credit-card-2-front-fill me-2" viewBox="0 0 16 16">
                                            <path d="M0 4a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V4zm2.5 1a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h2a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5h-2zm0 3a.5.5 0 0 0 0 1h5a.5.5 0 0 0 0-1h-5zm0 2a.5.5 0 0 0 0 1h1a.5.5 0 0 0 0-1h-1zm3 0a.5.5 0 0 0 0 1h1a.5.5 0 0 0 0-1h-1zm3 0a.5.5 0 0 0 0 1h1a.5.5 0 0 0 0-1h-1zm3 0a.5.5 0 0 0 0 1h1a.5.5 0 0 0 0-1h-1z"/>
                                        </svg>
                                        Purchase now
                                    </button>
                                </form>
                                <%
                                    if(!isAddedCart){
                                %>
                                    <form class="container me-5" action="/_WebMaster/control" method="POST">
                                        <input type="hidden" name="requestAction" value="Add to cart">
                                        <input type="hidden" name="productID" value="<%=x.getId()%>">
                                        <input type="hidden" name="productName" value="<%=x.getProductName()%>">
                                        <input type="hidden" name="email" value="<%=xUser.getEmail()%>">
                                        <button type="submit" class="btn btn-success btn-lg d-flex align-items-center">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-cart-fill me-2" viewBox="0 0 16 16">
                                                <path d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
                                            </svg>
                                            Add to cart
                                        </button>
                                    </form>
                                <%}else{%>
                                    <div>
                                        <form class="container me-5" action="control">
                                            <input type="hidden" name="requestAction" value="View Cart"/>
                                            <button type="submit" class="btn btn-success btn-lg d-flex align-items-center">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-cart-fill me-2" viewBox="0 0 16 16">
                                                    <path d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
                                                </svg>
                                            Added
                                        </button>
                                    </form>
                                    </div>
                                <%}%>
                            </div>
                            <!--IF PURCHASED-->
                            <%}else{%>
                                <div>
                                    <a  target="_blank"
                                        href="<%=x.getSource()%>"
                                        style="width: fit-content"
                                        class="btn btn-outline-success btn-lg d-flex align-items-center text-center">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-file-earmark-code-fill me-2" viewBox="0 0 16 16">
                                                <path d="M9.293 0H4a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2V4.707A1 1 0 0 0 13.707 4L10 .293A1 1 0 0 0 9.293 0zM9.5 3.5v-2l3 3h-2a1 1 0 0 1-1-1zM6.646 7.646a.5.5 0 1 1 .708.708L5.707 10l1.647 1.646a.5.5 0 0 1-.708.708l-2-2a.5.5 0 0 1 0-.708l2-2zm2.708 0 2 2a.5.5 0 0 1 0 .708l-2 2a.5.5 0 0 1-.708-.708L10.293 10 8.646 8.354a.5.5 0 1 1 .708-.708z"/>
                                            </svg>
                                            Purchased | Get File
                                    </a>
                                </div>
                                <%if(!isRated){%>
                                    <div style="display: flex">
                                        <form action="/_WebMaster/control" method="POST">
                                            <input class="star star-1" id="star-1" type="radio" name="rate" value="5"/>
                                            <label class="star star-1" for="star-1"></label>
                                            <input class="star star-2" id="star-2" type="radio" name="rate" value="4"/>
                                            <label class="star star-2" for="star-2"></label>
                                            <input class="star star-3" id="star-3" type="radio" name="rate" value="3"/>
                                            <label class="star star-3" for="star-3"></label>
                                            <input class="star star-4" id="star-4" type="radio" name="rate" value="2"/>
                                            <label class="star star-4" for="star-4"></label>
                                            <input class="star star-5" id="star-5" type="radio" name="rate" value="1"/>
                                            <label class="star star-5" for="star-5"></label>
                                            <input type="hidden" name="requestAction" value="Rate">
                                            <input type="hidden" name="productid" value="<%=x.getId()%>">
                                            <button type="submit" class="btn btn-info btn-rate">
                                                Rate
                                            </button>
                                        </form>
                                    </div>
                                <%}%>
                            <%}%>
                    </div>
                </div>
            </div>
            <!--Other post-->
        </div>
        
    </body>
</html>
