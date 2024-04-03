<%-- 
    Document   : ChangePassword
    Created on : Oct 8, 2023, 2:19:36 PM
    Author     : lap21
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "model.Users.*" %>
<%@page import = "model.Product.*" %>
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
    Product x = (Product) session.getAttribute("x");
    if(x == null){
        x = new Product("", "", "", "", 0, "");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="/_WebMaster/assests/css/bootstrap.min.css"/>
        <link rel="stylesheet" type="text/css" href="/_WebMaster/assests/css/style_login.css"/>
        <title>Add Product|WebMaster</title>
    </head>
    <body>
        <%@include file="/navigator/Toast.jsp" %>
        <div class="wrapper">
            <div class="container main">
                <div class="row" style="height: 800px; width: 1200px">
                    <div class="col-md-6 side-image" style="background-image: url(/_WebMaster/assests/images/product_thumnail/<%=x.getThumbnail()%>)">
                    </div>
                    <div class="col-md-6 right">
                        <div class="input-box">
                           <header>Add Product</header>
                           <form action="/_WebMaster/control" method="POST">
                                <div class="">
                                    <div class="text-info">Product Name<div>
                                            <input type="text" class="input" name="productName" value="<%=x.getProductName()%>" required>
                                </div>
                                <div class="">
                                    <div class="text-info">Description<div>
                                        <textarea type="text" class="input" name="description"required><%=x.getDescription()%></textarea>
                                </div>
                                <div class="">
                                    <div class="text-info">Thumbnail</div>
                                    <input type="text" class="input" placeholder=".jpg | .png" pattern="^.+(\.jpg|\.png)$" title="must end witth .jpg or .png" name="thumbnail" value="<%=x.getThumbnail()%>">
                                </div>
                                <div class="mb-3">
                                    <div class="text-info mb-1">Type</div>
                                    <label class="text-light text-opacity-75">
                                        <input type="radio" name="type" value="Java file" <%= "Java file".equals(x.getType()) ? "checked" : "" %> required> Java file
                                    </label>
                                    <label class="text-light text-opacity-75">
                                        <input type="radio" name="type" value="HTML file" <%= "HTML file".equals(x.getType()) ? "checked" : "" %>> HTML file
                                    </label>
                                    <label class="text-light text-opacity-75">
                                        <input type="radio" name="type" value="JSP file" <%= "JSP file".equals(x.getType()) ? "checked" : "" %>> JSP file
                                    </label>
                                </div>
                                <div class="">
                                    <div class="text-info">Cost</div>
                                    <input type="number" class="input" pattern="^\d+(\.\d+)?$" placeholder="00.00" min="0" step="0.01" name="cost" value="<%= String.format("%.2f", x.getCost())%>" required>
                                </div>
                                <div class="">
                                    <div class="text-info">Source</div>
                                    <input type="url" class="input" placeholder="url..." name="source" value="<%=x.getSource()%>">
                                </div>
                                <div class="input-field">
                                    <input type="submit" class="submit" name="requestAction" value="Update Product">
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
